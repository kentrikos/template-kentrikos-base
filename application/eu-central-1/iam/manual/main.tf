module "application_iam" {
  source = "github.com/kentrikos/terraform-aws-iam-generator//application?ref=0.2.0"

  region              = "${var.region}"
  product_domain_name = "${var.product_domain_name}"
  environment_type    = "${var.environment_type}"

  operations_aws_account_number  = "${var.operations_aws_account_number}"
  application_aws_account_number = "${var.application_aws_account_number}"

  k8s_cluster_name_postfix = "${var.k8s_cluster_name_postfix}"
  logs_not_resource        = "${var.logs_not_resource}"

  auto_IAM_mode = "${var.auto_IAM_mode}"
  auto_IAM_path = "${var.auto_IAM_path}"
}
