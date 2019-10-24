
locals {
  common_tag = {
    "product_domain"   = var.product_domain_name
    "environment_type" = var.environment_type
  }
}

module "vpc-endpoint-services-to-ingress" {
  source = "github.com/kentrikos/terraform-aws-vpc-endpoint-service-to-ingress?ref=0.1.0"

  vpc_id = var.vpc_id

  vpces_acceptance_required = var.vpces_acceptance_required
  vpces_allowed_principals  = var.vpces_allowed_principals

  common_tag = local.common_tag
}

