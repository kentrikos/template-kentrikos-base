###############################################################################
# Application account configuration
###############################################################################

# AWS account id of your application account. This account will contain your
# (public) Kubernetes cluster and applications. Example:
# application_aws_account_number = "210987654321"

application_aws_account_number = "XXX"

###############################################################################
# Operations account configuration
###############################################################################

# AWS account id of your operations account. This account will contain your
# (private) Kubernetes cluster and management tools on top of it. Example:
# operations_aws_account_number = "123456789012"

operations_aws_account_number = "XXX"

# For the deployments IAM policies and IAM roles need to be created. In most of
# the AWS environment we've seen you are able to work with IAM roles, but often
# you can't create IAM policies by your own.
#
# With this setting you can control if IAM policies will be created by
# terraform (true) or if the IAM Policies already exists in your account.
# If this parameter is true, terraform will create the IAM policies for Jenkins
# and Kubernetes. Example:
# auto_IAM_mode = true

auto_IAM_mode = false

# IAM path for all policies automatically created by this terraform deployment.
# IAM path must start and end with "/". Examples:
# auto_IAM_path = "/"
#   or
# auto_IAM_path = "/path/for/my/policy/"

auto_IAM_path = "/"

# Deprecated and customer specific - do not use/modify!
# List of resources (=arns) that will be added as NotResource for IAM log
# policy. If set, police will use for NotResource, for example:
#
# logs_not_resource = ["arn:aws:logs:eu-central-1:123456789012:myloggroup"]
#
# This will result in the following IAM policy:
#
# {
#    "Version":"2012-10-17",
#    "Statement":[
#        {
#            "Sid":"AllowLogModifications",
#            "Effect":"Allow",
#            "Action":[
#                ...
#            ],
#            "NotResource":[
#                "arn:aws:logs:eu-central-1:123456789012:myloggroup"
#            ]
#        }
#    ]
# }
#
# If the value is empty, the policy will allow actions for all Resources, for
# example:
#
# logs_not_resource = []
#
# This will result in the following IAM policy:
#
# {
#    "Version":"2012-10-17",
#    "Statement":[
#        {
#            "Sid":"AllowLogModifications",
#            "Effect":"Allow",
#            "Action":[
#                ...
#            ],
#            "Resource":[
#                "*"
#            ]
#        }
#    ]
# }
#
# Default: logs_not_resource = []

logs_not_resource = []

# The following settings will configure tags and names in the deployment, e.g.
# for EC2 instance name tags. Examples:
# environment_type = "test"
# product_domain_name = "demo"

environment_type = "XXX"

product_domain_name = "XXX"

# IMPORTANT NOTE: Currently only one or three availability zones are supported.
#
# Parameters to configure the network for your deployment. Enter the target AWS
# region, availability zones and existing VPC ID (for operations account only
# existing VPCs are accepted).
# Example:
# region = "eu-central-1"
# azs = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
# vpc_id = "vpc-abcdefg0123456789"

region = "eu-central-1"

azs = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

vpc_id = "vpc-XXXXXX"

# Proxy settings to use for Internet access. Enter the proxy address (FQDN or IP
# incl.  # authentication information if needed, without http(s):// prefix)
# and proxy port (without quotation marks). Example:
# http_proxy = "domain\username:password@proxyaddress"
# http_proxy_port = 8080
# no_proxy = "localhost,127.0.0.1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,169.254.169.254,.internal,.elb.us-east-1.amazonaws.com,.elb.amazonaws.com"

http_proxy = ""

http_proxy_port = 8080

no_proxy = ""

###############################################################################
# Core Infra Jenkins Configuration in Operations account
###############################################################################

# The Git repo url with Product Domain configuration. This is the ssh git clone
# url of the repository where you store this updated config file. Examples:
# jenkins_config_repo_url = "ssh://git@github.com:kentrikos/env-config.git"
#     or
# jenkins_config_repo_url = "ssh://git@git.comp.net:7999/~user/env-config.git"

jenkins_config_repo_url = "XXX"

# IMPORTANT NOTE: This setting is only relevant if setting "auto_IAM_mode =
# false". If setting "auto_IAM_mode = true", the settings "auto_IAM_path" and
# "jenkins_iam_policy_names_prefix" should be identical.
#
# This setting defines the IAM path for all policies created by terraform and
# attached to the Core Infra Jenkins. IAM path must start and end with "/".
# Examples:
# jenkins_iam_policy_names_prefix = "/"
#   or
# jenkins_iam_policy_names_prefix = "/path/for/my/policy/"

jenkins_iam_policy_names_prefix = "/"

# Enter the target Subnet ID of an existing subnet where Jenkins will be
# deployed (for operations account only existing Subnets are accepted).
# Example:
# jenkins_subnet_id = "subnet-abcd1234"

jenkins_subnet_id = "subnet-ZXC"

# CIDRs to configure the security group for Jenkins to allow http (port 8080)
# and ssh (port 22) access. Provide a list of valid CIDRs like
# ["10.2.0.0/16","10.10.0.0/24"]. Example:
# jenkins_http_allowed_cidrs = ["10.0.0.0/8"]
# jenkins_ssh_allowed_cidrs = ["10.0.0.0/8"]

jenkins_http_allowed_cidrs = ["10.0.0.0/8"]

jenkins_ssh_allowed_cidrs = ["10.0.0.0/8"]

# Instance type for Core Infra Jenkins Master. Valid instance types are all
# types which are available in the target region for Amazon Linux

jenkins_ec2_instance_type = "t3.medium"

# AWS Route53 Hosted Zone ID for domain that will be used by Jenkins master
# Example:
# jenkins_dns_domain_hosted_zone_ID = "ABCDEFGHIJKLMN"

jenkins_dns_domain_hosted_zone_ID = ""

# This parameter is a prefix for wildcard alias that will be created for jenkins
# Example:
# jenkins_dns_hostname = "jenkins"
# and as result will be jenkins address - jenkins.myorganization.domain.com

jenkins_dns_hostname = "jenkins"

###############################################################################
# Kubernetes Cluster Configuration in Operations account
###############################################################################

# Domain name of Kubernetes cluster (currently only k8s.local is supported)

k8s_cluster_name_postfix = "k8s.local"

# List of existing IAM policies that will be attached to instance profile for
# master nodes (EC2 instances).
# Schema: arn:aws:iam::{operations_aws_account_number}:policy/masters.{region}-{product_domain_name}-{environment_type}-ops.k8s.local
#         arn:aws:iam::{operations_aws_account_number}:policy/masters_extra.{region}-{product_domain_name}-{environment_type}-ops.k8s.local
# Example:
# k8s_masters_iam_policies_arns = [
#   "arn:aws:iam::123456789012:policy/masters.eu-central-1-demo-test-ops.k8s.local",
#   "arn:aws:iam::123456789012:policy/masters_extra.eu-central-1-demo-test-ops.k8s.local",
# ]

k8s_masters_iam_policies_arns = [
  "arn:aws:iam::{operations_aws_account_number}:policy/masters.{region}-{product_domain_name}-{environment_type}-ops.k8s.local",
  "arn:aws:iam::{operations_aws_account_number}:policy/masters_extra.{region}-{product_domain_name}-{environment_type}-ops.k8s.local",
]

# List of existing IAM policies that will be attached to instance profile for
# worker nodes (EC2 instances).
# Schema:
#   arn:aws:iam::{operations_aws_account_number}:policy/nodes.{region}-{product_domain_name}-{environment_type}-ops.k8s.local
#   arn:aws:iam::{operations_aws_account_number}:policy/KENTRIKOS_{region}.{product_domain_name}-{environment_type}_AssumeCrossAccount",
# Example:
# k8s_nodes_iam_policies_arns = [
#   "arn:aws:iam::123456789012:policy/nodes.eu-central-1-demo-test-ops.k8s.local",
#   "arn:aws:iam::123456789012:policy/KENTRIKOS_eu-central.demo-test_AssumeCrossAccount",
# ]

k8s_nodes_iam_policies_arns = [
  "arn:aws:iam::{operations_aws_account_number}:policy/nodes.{region}-{product_domain_name}-{environment_type}-ops.k8s.local",
  "arn:aws:iam::{operations_aws_account_number}:policy/KENTRIKOS_{region}.{product_domain_name}-{environment_type}_AssumeCrossAccount",
]

# IMPORTANT NOTE: The list of (private) subnets must match the param "azs" from
# above. If you enter azs = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
# you have to submit subnet ids in all those availability zones.
#
# Enter a list of target Subnet IDs of existing subnets where the Kubernetes
# cluster will be deployed (for operations account only existing Subnets are
# accepted). Example:
# k8s_private_subnets = ["subnet-abcd1234", "subnet-defg5678", "subnet-hijk0912"]

k8s_private_subnets = ["subnet-XXXX", "subnet-ZZZZ", "subnet-YYYY"]

# Instance types for Kubernetes Master Nodes , Kubernetes Worker Nodes and
# amount of Kubernetes Worker Nodes.
# IMPORTANT NOTE Please check if chosen instance types are available in the
# target region for Linux operating systems.
# Examples:
# k8s_master_instance_type = "m4.large"
# k8s_node_instance_type = "m4.large"
# k8s_node_count = "3"

k8s_master_instance_type = "m4.large"

k8s_node_instance_type = "m4.large"

k8s_node_count = "3"

# Optional name of existing SSH keypair on AWS account, to be used for cluster
# instances (will be generated if not specified)

k8s_aws_ssh_keypair_name = ""

# Linux distribution for K8s cluster instances (supported values: debian, amzn2)
# Example:
# k8s_linux_distro = "debian"

k8s_linux_distro = "debian"

# Enable horizontal pod autoscaling for the cluster.
# Horizontal pod scaling is the scaling of pods withing the cluster.
# Example:
# k8s_enable_pod_autoscaling = true

k8s_enable_pod_autoscaling = true

# Enable cluster autoscaling on the cluster.
# Cluster autoscaling is scaling of the cluster nodes (EC2 instances)
# Example:
# k8s_enable_cluster_autoscaling = true

k8s_enable_cluster_autoscaling = true

# Enable cluster scale in protection.
# This will prevent instances from being terminated during a scale in.
# Example:
# k8s_protect_cluster_from_scale_in = true

k8s_protect_cluster_from_scale_in = false

# Enables the automatic installation of Helm in the cluster
# Example:
# k8s_install_helm = true

k8s_install_helm = true

# List of CIDR ranges that will be allowed SSH into cluster node instances.
# Example:
# k8s_allowed_worker_ssh_cidrs = ["10.10.0.0/8"]

k8s_allowed_worker_ssh_cidrs = []
