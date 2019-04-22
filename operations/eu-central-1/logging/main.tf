data "aws_caller_identity" "current" {}

data "aws_subnet" "private_subnets" {
  count = "${length(var.k8s_private_subnets)}"
  id    = "${var.k8s_private_subnets[count.index]}"
}

# Create the fluentd docker image and push to ECR
module "fluentd_elasticsearch_image" {
  source = "github.com/kentrikos/terraform-aws-docker-ecr"

  git_repo_url    = "https://github.com/kentrikos/fluentd-aws-elasticsearch.git"
  repository_name = "aws-fluentd-elasticsearch"
  ecr_image_tag   = "latest"
}

# Grant cross account access to the ECR repository for fluentd
resource "aws_ecr_repository_policy" "cross_account_access" {
  count      = "${var.application_aws_account_number != "" ? 1 : 0 }"
  repository = "${module.fluentd_elasticsearch_image.repository_name}"
  policy     = "${data.aws_iam_policy_document.ecr_cross_account_policy.json}"
}

# Create ElasticSearch domain
module "elasticsearch" {
  source = "github.com/kentrikos/terraform-aws-elasticsearch.git?ref=0.1.0"

  region                          = "${var.region}"
  vpc_id                          = "${var.vpc_id}"
  subnet_ids                      = "${var.k8s_private_subnets}"
  domain_name                     = "${var.region}-${var.product_domain_name}-${var.environment_type}-ops"
  dedicated_master_instance_count = "${var.elasticsearch_instance_count}"
  instance_count                  = "${var.elasticsearch_instance_count}"
  allowed_cidrs                   = ["${concat(data.aws_subnet.private_subnets.*.cidr_block, var.logging_allowed_cidrs)}"]
}

data "aws_iam_policy_document" "ecr_cross_account_policy" {
  statement {
    sid = "ECRCrossAccountAccess"

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
    ]

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.application_aws_account_number}:root"]
    }
  }
}

# Grant cross-account access to ElasticSearch
data "aws_iam_policy_document" "operations_logging_policy" {
  statement {
    sid    = "ElasticSearchLimitedAccess"
    effect = "Allow"

    actions = [
      "es:ESHttpPost",
      "es:ESHttpGet",
      "es:ESHttpPut",
    ]

    resources = ["${module.elasticsearch.arn}"]
  }
}

data "aws_iam_policy_document" "operations_logging_trust_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.application_aws_account_number}:root"]
    }
  }
}

resource "aws_iam_policy" "operations_logging" {
  name   = "KENTRIKOS_logging_${var.region}_${var.product_domain_name}_${var.environment_type}"
  policy = "${data.aws_iam_policy_document.operations_logging_policy.json}"
}

resource "aws_iam_role" "operations_logging_role" {
  name               = "${var.region}_${var.product_domain_name}_${var.environment_type}-ops-logging"
  assume_role_policy = "${var.application_aws_account_number != "" ? data.aws_iam_policy_document.operations_logging_trust_policy.json : ""}"
}

resource "aws_iam_role_policy_attachment" "operations_logging" {
  role       = "${aws_iam_role.operations_logging_role.id}"
  policy_arn = "${aws_iam_policy.operations_logging.arn}"
}

# Install fluentd via Helm
data "template_file" "fluentd_values" {
  template = "${file("${path.module}/templates/fluentd_values.yaml.tpl")}"

  vars = {
    elasticsearch_endpoint = "https://${module.elasticsearch.endpoint}"
    image_url              = "${module.fluentd_elasticsearch_image.repository_url}"
    image_tag              = "${module.fluentd_elasticsearch_image.image_tag}"
    region                 = "${var.region}"
    logstash_prefix        = "logstash"
  }
}

resource "helm_release" "fluentd" {
  name      = "fluentd-elasticsearch"
  chart     = "stable/fluentd-elasticsearch"
  namespace = "logging"

  values     = ["${data.template_file.fluentd_values.rendered}"]
  depends_on = ["module.elasticsearch"]
}
