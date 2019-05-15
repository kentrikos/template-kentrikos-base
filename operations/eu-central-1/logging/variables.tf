//Existing variables
variable "vpc_id" {}

variable "region" {}

variable "cluster_context" {}

variable "elasticsearch_subnet_ids" {
  type = "list"
}

variable "product_domain_name" {}

variable "environment_type" {}

variable "elasticsearch_allowed_cidrs" {
  type = "list"
}

//New variables
variable "elasticsearch_instance_type" {}

variable "elasticsearch_instance_count" {}

variable "elasticsearch_master_type" {}
variable "elasticsearch_master_count" {}

variable "elasticearch_volume_size" {}

variable "elasticsearch_enable_zone_awareness" {}

variable "tiller_service_account" {
  default = "tiller"
}

variable "fluentd_image_repository" {}

variable "fluentd_image_tag" {}

variable "application_aws_account_number" {}
