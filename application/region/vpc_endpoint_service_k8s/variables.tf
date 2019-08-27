variable "vpc_id" {
}

variable "vpces_acceptance_required" {
}

variable "vpces_allowed_principals" {
  type = list(string)
}

variable "ingress_nlb_listener_port" {
}

variable "product_domain_name" {
}

variable "environment_type" {
}

variable "region" {
}

variable "application_aws_account_number" {
}

variable "k8s_private_subnets" {
  type = list(string)
}

variable "cluster_type" {
  description = "Kubernetes flavor (eks or kops)"
}

