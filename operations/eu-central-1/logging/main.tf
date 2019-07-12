data "aws_vpc" "this" {
  id = var.vpc_id
}

locals {
  trusted_app_role_arn = "arn:aws:iam::${var.application_aws_account_number}:root"
}

module "elasticsearch_logging" {
  source                    = "github.com/kentrikos/terraform-aws-logging?ref=terraform12"
  region                    = var.region
  vpc_id                    = var.vpc_id
  elasticsearch_subnet_ids  = var.elasticsearch_subnet_ids
  elasticsearch_domain_name = "${var.region}-${var.product_domain_name}-${var.environment_type}"
  elasticsearch_allowed_cidrs = concat(
    [data.aws_vpc.this.cidr_block],
    var.elasticsearch_allowed_cidrs,
  )
  elasticsearch_instance_count         = var.elasticsearch_instance_count
  elasticsearch_instance_type          = var.elasticsearch_instance_type
  elasticsearch_dedicated_master_count = var.elasticsearch_master_count
  elasticsearch_dedicated_master_type  = var.elasticsearch_master_type
  elasticsearch_volume_size            = var.elasticearch_volume_size
  elasticsearch_enable_zone_awareness  = var.elasticsearch_enable_zone_awareness
  enable_fluentd                       = true
  cluster_context                      = var.cluster_context
  fluentd_image_repository             = var.fluentd_image_repository
  fluentd_image_tag                    = var.fluentd_image_tag
  tiller_service_account               = var.tiller_service_account
  trusted_roles_arns                   = [local.trusted_app_role_arn]
}

