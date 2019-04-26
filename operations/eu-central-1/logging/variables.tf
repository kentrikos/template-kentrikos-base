//Existing variables
variable "vpc_id" {}

variable "region" {}

variable "cluster_context" {}

variable "k8s_private_subnets" {
  type = "list"
}

variable "product_domain_name" {}

variable "environment_type" {}

variable "k8s_allowed_worker_ssh_cidrs" {
  type = "list"
}

//New variables
variable "elasticsearch_instance_type" {}

variable "elasticsearch_instance_count" {}

variable "elasticsearch_master_type" {}
variable "elasticsearch_master_count" {}

variable "elasticearch_volume_size" {}

variable "tiller_service_account" {
  default = "tiller"
}

variable "logging_allowed_cidrs" {
  type = "list"
}

variable "fluentd_image_repository" {}

variable "fluentd_image_tag" {}
