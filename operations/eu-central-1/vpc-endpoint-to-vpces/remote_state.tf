
data "terraform_remote_state" "vpces" {
  backend = "s3"

  config = {
    bucket = "tf-${var.application_aws_account_number}-app-${var.region}-${var.product_domain_name}-${var.environment_type}"
    key    = "tf/tf-aws-product-domain-${var.product_domain_name}-env-${var.environment_type}/vpc_endpoint_service_to_ingress/terraform.tfstate"
    region = var.region
  }
}

