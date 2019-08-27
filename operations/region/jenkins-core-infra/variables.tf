# JENKINS SECTION:

variable "region" {
  description = "AWS region"
}

variable "operations_aws_account_number" {
  description = "AWS operation account number (without hyphens)"
}

variable "application_aws_account_number" {
  description = "AWS application account number (without hyphens)"
}

variable "product_domain_name" {
  description = "Name of product domain, will be used to create other names"
}

variable "environment_type" {
  description = "Type of environment (e.g. test, production)"
}

variable "jenkins_iam_policy_names_prefix" {
  description = "Prefix for policy names created (default /)r"
}

variable "jenkins_ec2_instance_type" {
  description = "Instance type for Core Infra Jenkins Master"
}

variable "vpc_id" {
  description = "ID of existing VPC (must be pre-created with a portal)"
}

variable "jenkins_subnet_id" {
  description = "ID of existing subnet where Jenkins will be deployed"
}

variable "http_proxy" {
  description = "IP of corporate HTTP proxy"
}

variable "http_proxy_port" {
  description = "(Optional) HTTP proxy port to use for access to internet. This is required to install packages on instances deployed in ops AWS accounts."
}

variable "jenkins_ssh_allowed_cidrs" {
  description = "CIDRs we allow ssh from"
  type        = list(string)
}

variable "jenkins_http_allowed_cidrs" {
  description = "CIDRs we allow http from"
  type        = list(string)
}

variable "jenkins_config_repo_url" {
  description = "Git repo url with Product Domain configuration (Fork of this repo.)"
}

variable "auto_IAM_mode" {
  description = "Create IAM Policies in AWS"
}

variable "auto_IAM_path" {
  description = "IAM path for auto IAM mode uploaded policies"
}

variable "jenkins_dns_domain_hosted_zone_ID" {
  description = "R53 Hosted Zone ID for domain that will be used by Jenkins master"
}

variable "jenkins_dns_hostname" {
  description = "Local part of FQDN for Jenkins master"
}

