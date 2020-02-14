variable "product_domain_name" {
}

variable "environment_type" {
}

variable "k8s_private_subnets" {
  type = list(string)
}

variable "k8s_public_subnets" {
  type    = list(string)
  default = []
}

variable "k8s_node_count" {
}

variable "region" {
}

variable "azs" {
  type = list(string)
}

variable "vpc_id" {
}

variable "iam_cross_account_role_arn" {
}

variable "k8s_masters_iam_policies_arns" {
  type = list(string)
}

variable "k8s_nodes_iam_policies_arns" {
  type = list(string)
}

variable "k8s_master_instance_type" {
}

variable "k8s_node_instance_type" {
}

variable "k8s_aws_ssh_keypair_name" {
}

variable "k8s_linux_distro" {
}

variable "k8s_enable_pod_autoscaling" {
}

variable "k8s_enable_cluster_autoscaling" {
}

variable "k8s_protect_cluster_from_scale_in" {
}

variable "k8s_install_helm" {
}

variable "k8s_ingress_deploy" {
}

variable "k8s_allowed_worker_ssh_cidrs" {
  type = list(string)
}

variable "k8s_allowed_worker_nodeport_cidrs" {
  type = list(string)
}

variable "k8s_map_accounts" {
  type = list(string)
}

variable "k8s_map_roles" {
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
}

variable "k8s_map_users" {
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
}

variable "k8s_cluster_version" {
}

variable "ingress_helm_values" {}

variable "ingress_service_type" {}

variable "k8s_cluster_enabled_log_types" {
  type = list(string)
}

variable "node_groups_defaults" {
  type        = any
  default     = {}
}
variable "node_groups" {
  type        = any
  default     = {}
}
