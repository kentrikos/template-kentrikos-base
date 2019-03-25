variable "product_domain_name" {}

variable "environment_type" {}

variable "k8s_private_subnets" {
  type = "list"
}

variable "k8s_node_count" {}

variable "region" {}

variable "azs" {
  type = "list"
}

variable "vpc_id" {}

variable "iam_cross_account_role_arn" {}

variable "k8s_masters_iam_policies_arns" {
  type = "list"
}

variable "k8s_nodes_iam_policies_arns" {
  type = "list"
}

variable "k8s_master_instance_type" {}

variable "k8s_node_instance_type" {}

variable "k8s_aws_ssh_keypair_name" {}

variable "k8s_linux_distro" {}
