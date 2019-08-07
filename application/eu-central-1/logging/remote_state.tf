data "aws_caller_identity" "current" {
}

data "terraform_remote_state" "cluster" {
  backend = "s3"

  config = {
    bucket = "tf-${data.aws_caller_identity.current.account_id}-app-${var.region}-${var.product_domain_name}-${var.environment_type}"
    key    = "tf/tf-aws-product-domain-${var.product_domain_name}-env-${var.environment_type}/env-${var.cluster_type}/terraform.tfstate"
    region = var.region
  }
}

