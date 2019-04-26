data "aws_vpc" "this" {
  id = "${var.vpc_id}"
}

module "elasticsearch_logging" {
  source                      = "github.com/kentrikos/terraform-aws-logging?ref=firstbuild"
  region                      = "${var.region}"
  vpc_id                      = "${var.vpc_id}"
  subnet_ids                  = "${var.k8s_private_subnets}"
  domain_name                 = "${var.region}-${var.product_domain_name}-${var.environment_type}"
  elasticsearch_allowed_cidrs = "${concat(list(data.aws_vpc.this.cidr_block), var.logging_allowed_cidrs)}"
  instance_count              = "${var.elasticsearch_instance_count}"
  instance_type               = "${var.elasticsearch_instance_type}"
  dedicated_master_count      = "${var.elasticsearch_master_count}"
  dedicated_master_type       = "${var.elasticsearch_master_type}"
  volume_size                 = "${var.elasticearch_volume_size}"
  enable_zone_awareness       = "${var.elasticsearch_enable_zone_awareness}"
  enable_fluentd              = true
  cluster_context             = "${var.cluster_context}"
  fluentd_image_repository    = "${var.fluentd_image_repository}"
  fluentd_image_tag           = "${var.fluentd_image_tag}"
  tiller_service_account      = "${var.tiller_service_account}"
}
