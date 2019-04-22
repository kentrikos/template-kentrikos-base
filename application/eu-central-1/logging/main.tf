data "aws_caller_identity" "current" {}

locals {
  fluentd_elasticsearch_repository = "${var.operations_aws_account_number}.dkr.ecr.${var.region}.amazonaws.com/aws-fluentd-elasticsearch"
  assume_role_arn                  = "arn:aws:iam::${var.operations_aws_account_number}:role/${var.region}_${var.product_domain_name}_${var.environment_type}-ops-logging"
}

data "aws_iam_policy_document" "assume_cross_account_policy" {
  statement {
    sid       = "EKSWorkerAssumeOperationsLogging"
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = ["${local.assume_role_arn}"]
  }
}

resource "aws_iam_policy" "assume_cross_account_policy" {
  name   = "KENTRIKOS_ops-logging_${var.region}_${var.product_domain_name}_${var.environment_type}"
  policy = "${data.aws_iam_policy_document.assume_cross_account_policy.json}"
}

resource "aws_iam_role_policy_attachment" "cluster_worker_cross_account" {
  count      = "${var.operations_aws_account_number != "" ? 1 : 0}"
  role       = "${data.terraform_remote_state.cluster.worker_iam_role_name}"
  policy_arn = "${aws_iam_policy.assume_cross_account_policy.arn}"
}

# Install fluentd via Helm
data "template_file" "fluentd_values" {
  template = "${file("${path.module}/templates/fluentd_values.yaml.tpl")}"

  vars = {
    elasticsearch_endpoint   = "https://${var.elasticsearch_endpoint}"
    image_url                = "${local.fluentd_elasticsearch_repository}"
    image_tag                = "latest"
    region                   = "${var.region}"
    logstash_prefix          = "logstash"
    assume_role_arn          = "${local.assume_role_arn}"
    assume_role_session_name = "fluentd"
  }
}

resource "helm_release" "fluentd" {
  name       = "fluentd-elasticsearch"
  chart      = "stable/fluentd-elasticsearch"
  namespace  = "logging"
  values     = ["${data.template_file.fluentd_values.rendered}"]
  depends_on = ["aws_iam_role_policy_attachment.cluster_worker_cross_account"]
}
