module "operations" {
  source = "github.com/kentrikos/terraform-aws-account-operations?ref=0.4.2"

  product_domain_name = "${var.product_domain_name}"
  environment_type    = "${var.environment_type}"

  operations_aws_account_number = "${var.operations_aws_account_number}"

  k8s_private_subnets = "${var.k8s_private_subnets}"
  azs                 = "${var.azs}"
  vpc_id              = "${var.vpc_id}"
  region              = "${var.region}"
  http_proxy          = "${var.http_proxy}:${var.http_proxy_port}"
  no_proxy            = "${var.no_proxy}"

  k8s_node_count                    = "${var.k8s_node_count}"
  k8s_master_instance_type          = "${var.k8s_master_instance_type}"
  k8s_node_instance_type            = "${var.k8s_node_instance_type}"
  k8s_aws_ssh_keypair_name          = "${var.k8s_aws_ssh_keypair_name}"
  k8s_linux_distro                  = "${var.k8s_linux_distro}"
  k8s_enable_cluster_autoscaling    = "${var.k8s_enable_cluster_autoscaling}"
  k8s_enable_pod_autoscaling        = "${var.k8s_enable_pod_autoscaling}"
  k8s_protect_cluster_from_scale_in = "${var.k8s_protect_cluster_from_scale_in}"
  k8s_install_helm                  = "${var.k8s_install_helm}"
  k8s_allowed_worker_ssh_cidrs      = "${var.k8s_allowed_worker_ssh_cidrs}"

  k8s_masters_iam_policies_arns = "${var.k8s_masters_iam_policies_arns}"
  k8s_nodes_iam_policies_arns   = "${var.k8s_nodes_iam_policies_arns}"
}
