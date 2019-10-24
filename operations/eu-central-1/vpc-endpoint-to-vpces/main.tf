locals {
  common_tag = {
    "product_domain"   = var.product_domain_name
    "environment_type" = var.environment_type
  }
}

module "vpc-endpoint-services-to-ingress" {
  source = "github.com/kentrikos/terraform-aws-vpc-endpoint-to-vpces?ref=0.1.0"

  vpc_id                    = var.vpc_id
  vpces_service_name        = data.terraform_remote_state.vpces.outputs.vpces_service_name
  dns_domain_hosted_zone_ID = var.dns_domain_hosted_zone_ID
  endpoint_dns_hostname     = var.endpoint_dns_hostname

  common_tag         = local.common_tag
  security_group_ids = var.endpoint_security_group_ids
  subnet_ids         = var.endpoint_private_subnets
}

