variable "vpc_id" {
}

variable "product_domain_name" {
}

variable "environment_type" {
}

variable "region" {
}

variable "dns_domain_hosted_zone_ID" {}

variable "endpoint_dns_hostname" {}

variable "application_aws_account_number" {
  description = "AWS application account number (without hyphens)"
}

variable "endpoint_security_group_ids" {}

variable "endpoint_private_subnets" {}