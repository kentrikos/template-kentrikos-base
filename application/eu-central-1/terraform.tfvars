###############################################################################
# Application account configuration
###############################################################################

# AWS account id of your application account. This account will contain your
# (public) Kubernetes cluster and applications. Example:
# application_aws_account_number = "210987654321"

application_aws_account_number = "210987654321"

# For the deployments IAM policies and IAM roles need to be created. In most of
# the AWS environment we've seen you are able to work with IAM roles, but often
# you can't create IAM policies by your own.
#
# With this setting you can control if IAM policies will be created by
# terraform (true) or if the IAM Policies already exists in your account.
# If this parameter is true, terraform will create the IAM policies for
# Kubernetes. Example:
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
# for EC2 instance name tags. 
#
# IMPORTANT NOTE:
# The combination of region - product_domain_name - environment_type cannot be longer than 32 chars
# Examples: 
#   eu-central-1-long-product-domain-name-test = 43 chars
#   eu-central-1-product-domain-name-test = 38 chars
#   eu-central-1-productdomain-test = 32 chars
#
# otherwise your deployment will fail:
# 
# Examples:
# environment_type = "test"
# product_domain_name = "demo"

environment_type = "test"

product_domain_name = "demo"

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
# incl. authentication information if needed, without http(s):// prefix)
# and proxy port (without quotation marks). Example:
# http_proxy = "domain\username:password@proxyaddress"
# http_proxy_port = 8080

http_proxy = ""

http_proxy_port = 8080

###############################################################################
# Kubernetes Cluster Configuration in Applications account
###############################################################################

# List of existing IAM policies that will be attached to instance profile for
# master nodes (EC2 instances).
# Schema: arn:aws:iam::{application_aws_account_number}:policy/masters.{region}-{product_domain_name}-{environment_type}.k8s.local
#         arn:aws:iam::{application_aws_account_number}:policy/masters_extra.{region}-{product_domain_name}-{environment_type}.k8s.local
# Example:
# k8s_masters_iam_policies_arns = [
#   "arn:aws:iam::210987654321:policy/masters.eu-central-1-demo-test.k8s.local",
#   "arn:aws:iam::210987654321:policy/masters_extra.eu-central-1-demo-test.k8s.local",
# ]

k8s_masters_iam_policies_arns = [
  "arn:aws:iam::210987654321:policy/masters.eu-central-1-demo-test.k8s.local",
  "arn:aws:iam::210987654321:policy/masters_extra.eu-central-1-demo-test.k8s.local",
]

# List of existing IAM policies that will be attached to instance profile for
# worker nodes (EC2 instances):
# Schema: arn:aws:iam::{application_aws_account_number}:policy/nodes.{region}-{product_domain_name}-{environment_type}.k8s.local
# Example:
# k8s_nodes_iam_policies_arns = [
#   "arn:aws:iam::210987654321:policy/nodes.eu-central-1-demo-test.k8s.local",
# ]

k8s_nodes_iam_policies_arns = [
  "arn:aws:iam::210987654321:policy/nodes.eu-central-1-demo-test.k8s.local",
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

# Enter a list of target Subnet IDs of existing subnets where the Kubernetes
# cluster will be deployed. Public subnets will be tagged to allow cluster ingress creation.
# Example:
# k8s_public_subnets = ["subnet-abcd1234", "subnet-defg5678", "subnet-hijk0912"]

k8s_public_subnets = ["subnet-XXXX", "subnet-ZZZZ", "subnet-YYYY"]

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

# VPC Endpoint Service for ingress:

# Deploy Kubernetes Ingress controller on the cluster (requires install_helm=true)
# Example:
# k8s_ingress_deploy = true

k8s_ingress_deploy = true

# Port for the listener of NLB associated with ingress
# Example:
# ingress_nlb_listener_port = 80

ingress_nlb_listener_port = 80

# Whether or not VPC endpoint connection requests to the service must be accepted by the service owner
# Example:
# vpces_acceptance_required = "true"

vpces_acceptance_required = true

# The ARNs of one or more principals allowed to discover the endpoint service
# Example:
# vpces_allowed_principals = ["arn:aws:iam::210987654321:root"]

vpces_allowed_principals = []

# List of CIDR ranges that will be allowed connect into cluster node port.
# Example:
# k8s_allowed_worker_nodeport_cidrs = ["10.0.0.0/8"]
k8s_allowed_worker_nodeport_cidrs = []

###############################################################################
# Operations account configuration
###############################################################################

# AWS account id of your operations account. This account will contain your
# (private) Kubernetes cluster and management tools on top of it. Example:
# operations_aws_account_number = "123456789012"

operations_aws_account_number = "123456789012"

# Cross-account role to assume before deploying the cluster.
# For auto_IAM_mode = false
# Example:
# iam_cross_account_role_arn = "arn:aws:iam::210987654321:role/KopsCrossAccount"
# For auto_IAM_mode = true
# Schema:  arn:aws:iam::{application_aws_account_number}:role/KENTRIKOS_{region}_{product_domain_name}_{environment_type}_CrossAccount
# Example: arn:aws:iam::210987654321:role/KENTRIKOS_eu-central-1_demo_test_CrossAccount"

iam_cross_account_role_arn = "arn:aws:iam::210987654321:role/KopsCrossAccount"

# iam_cross_account_role_arn = "arn:aws:iam::210987654321:role/KENTRIKOS_eu-central-1_demo_test_CrossAccount"

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
# k8s_allowed_worker_ssh_cidrs = ["10.0.0.0/8"]

k8s_allowed_worker_ssh_cidrs = []

# Name of the service account used for Helm Tiller
# Example:
# tiller_service_acccount = "tiller"
tiller_service_account = "tiller"

# Additional AWS account numbers to add to the aws-auth configmap. See terraform-aws-modules-eks examples/basic/variables.tf for example format.
# Example:
# k8s_map_accounts=["777777777777",
#               "888888888888",]
k8s_map_accounts = []

# Additional IAM roles to add to the aws-auth configmap. See terraform-aws-modules-eks examples/basic/variables.tf for example format.
# Example:
# k8s_map_roles=[
#  {
#    role_arn = "arn:aws:iam::66666666666:role/role1"
#    username = "role1"
#    group    = "system:masters"
#  },
#]
k8s_map_roles = []

# Additional IAM users to add to the aws-auth configmap. See terraform-aws-modules-eksexamples/basic/variables.tf for example format.
# Example:
#  k8s_map_users = [
#   {
#     userarn  = "arn:aws:iam::66666666666:user/user1"
#     username = "user1"
#     groups   = ["system:masters"]
#   },
#   {
#     userarn  = "arn:aws:iam::66666666666:user/user2"
#     username = "user2"
#     groups   = ["system:masters"]
#   },
# ]
k8s_map_users = []

# Kubernetes version to use for the EKS cluster.
# Example:
# k8s_cluster_version = "1.14"
k8s_cluster_version = "1.14"


ingress_helm_values = {
  "controller.service.targetPorts.http"                                                        = "http"
  "controller.service.targetPorts.https"                                                       = "https"
  "controller.service.enableHttps"                                                             = "true"
  "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"     = "nlb"
  "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-internal" = "true"
  "controller.config.ssl-protocols"                                                            = "TLSv1 TLSv1.1 TLSv1.2"
  "controller.config.ssl-ciphers"                                                              = "ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA"
}

ingress_service_type = "LoadBalancer"

# Awaliable options ["api", "audit", "authenticator", "controllerManager", "scheduler"]
k8s_cluster_enabled_log_types = []

# Defaults variables for all manage node groups
# `node_groups_defaults` is a map with values which will be used if not specified in individual node groups.
# node_groups_defaults = {
#   ami_type         = "AL2_x86_64"
#   disk_size        = "100"
#   key_name         = var.k8s_aws_ssh_keypair_name
#   desired_capacity = "1"
#   max_capacity     = "10"
#   min_capacity     = "1"
#   instance_type    = "t3.small"
#   subnets          = var.k8s_private_subnets
#   version          = var.k8s_cluster_version
# }

# Node groups setup
# Example
# node_groups = {
#  example_group_1 = {
    # desired_capacity = 1
    # max_capacity     = 10
    # min_capacity     = 1
    # disk_size        = "50"
    # instance_type = "m4.large"
#  }
# }

# For multiple groups 
# node_groups = {
#   example_group_1 = {
#     desired_capacity = 1
#     max_capacity     = 10
#     min_capacity     = 1

#     instance_type = "m3.large"
#   },
#   example_group_2 = {
#       desired_capacity = 1
#       max_capacity     = 4
#       min_capacity     = 1
#       instance_type = "m4.large"
#   }
# }