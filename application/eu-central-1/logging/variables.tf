//Existing variables
variable "vpc_id" {}

variable "region" {}

variable "product_domain_name" {}

variable "environment_type" {}

variable "operations_aws_account_number" {}

variable "tiller_service_account" {
  default = "tiller"
}

variable "cluster_context" {}

variable "elasticsearch_endpoint" {}
