# Remote state of K8s cluster deployment:
data "terraform_remote_state" "application-account" {
  backend = "s3"

  config {
    bucket = "tf-${var.application_aws_account_number}-app-${var.region}-${var.product_domain_name}-${var.environment_type}"
    key    = "tf/tf-aws-product-domain-${var.product_domain_name}-env-${var.environment_type}/env-${var.cluster_type}/terraform.tfstate"
    region = "${var.region}"
  }
}

locals {
  common_tag = "${map(
     "product_domain", "${var.product_domain_name}",
     "environment_type", "${var.environment_type}"
   )}"
}

module "vpc-endpoint-services-nlb-ingress" {
  source = "github.com/kentrikos/terraform-aws-k8s-ingress-proxy-vpc-endpoint-service.git?ref=0.1.0"

  vpc_id            = "${var.vpc_id}"
  nlb_name          = "${var.product_domain_name}-${var.environment_type}-ingress-nlb"
  nlb_subnets       = "${var.k8s_private_subnets}"
  nlb_listener_port = "${var.ingress_nlb_listener_port}"

  k8s_ingress_service_nodeport = "${data.terraform_remote_state.application-account.ingress_service_nodeport}"
  k8s_workers_asg_names        = "${data.terraform_remote_state.application-account.workers_asg_names}"

  vpces_acceptance_required = "${var.vpces_acceptance_required}"
  vpces_allowed_principals  = "${var.vpces_allowed_principals}"

  common_tag = "${local.common_tag}"
}
