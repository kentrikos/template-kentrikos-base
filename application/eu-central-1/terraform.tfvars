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
# for EC2 instance name tags. Examples:
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

# Proxy settings to use for Internet access. Enter the proxy address (incl.
# authentication information if needed, without http(s):// prefix) and proxy
# port (without quotation marks). Example:
# http_proxy = "domain\username:password@proxyaddress:port"
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

