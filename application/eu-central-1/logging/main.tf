locals {
  assume_role_arn = "arn:aws:iam::${var.operations_aws_account_number}:role/elasticsearch-logging-${var.region}-${var.product_domain_name}-${var.environment_type}"
}

module "elasticsearch_logging" {
  source                    = "github.com/kentrikos/terraform-aws-logging-app?ref=firstbuild"
  region                    = "${var.region}"
  elasticsearch_domain_name = "${var.region}-${var.product_domain_name}-${var.environment_type}"
  elasticsearch_endpoint    = "${var.elasticsearch_endpoint}"
  cluster_context           = "${var.cluster_context}"
  fluentd_image_repository  = "${var.fluentd_image_repository}"
  fluentd_image_tag         = "${var.fluentd_image_tag}"
  tiller_service_account    = "${var.tiller_service_account}"
  assume_role_arn           = "${local.assume_role_arn}"
  cluster_worker_role_name  = "${data.terraform_remote_state.cluster.worker_iam_role_name}"
}
