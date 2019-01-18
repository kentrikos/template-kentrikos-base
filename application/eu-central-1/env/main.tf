module "application" {
  source = "github.com/kentrikos/terraform-aws-account-application"

  product_domain_name = "${var.product_domain_name}"
  environment_type    = "${var.environment_type}"

  region              = "${var.region}"
  azs                 = "${var.azs}"
  vpc_id              = "${var.vpc_id}"
  k8s_private_subnets = "${var.k8s_private_subnets}"

  k8s_node_count           = "${var.k8s_node_count}"
  k8s_master_instance_type = "${var.k8s_master_instance_type}"
  k8s_node_instance_type   = "${var.k8s_node_instance_type}"
  k8s_aws_ssh_keypair_name = "${var.k8s_aws_ssh_keypair_name}"

  iam_cross_account_role_arn    = "${var.iam_cross_account_role_arn}"
  k8s_masters_iam_policies_arns = "${var.k8s_masters_iam_policies_arns}"
  k8s_nodes_iam_policies_arns   = "${var.k8s_nodes_iam_policies_arns}"
}
