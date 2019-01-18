application_aws_account_number = "210987654321" # AWS application account number (without hyphens)

auto_IAM_mode = false # Create IAM Policies in AWS (default false)

auto_IAM_path = "/" # IAM path for auto IAM mode uploaded policies

azs = ["eu-central-1a", "eu-central-1b", "eu-central-1c"] # Availability Zones for the cluster (1 master per AZ will be deployed)

environment_type = "test" # Type of environment (e.g. test, production)

http_proxy = "" # IP of corporate HTTP proxy

http_proxy_port = 8080 # HTTP proxy port to use for access to internet. This is required to install packages on instances deployed in ops AWS accounts.

iam_cross_account_role_arn = "arn:aws:iam::210987654321:role/KopsCrossAccount" # Cross-account role to assume before deploying the cluster

k8s_master_instance_type = "m4.large" # Instance type (size) for master nodes

k8s_masters_iam_policies_arns = [
  "arn:aws:iam::210987654321:policy/masters.demo-test.k8s.local",
  "arn:aws:iam::210987654321:policy/masters_extra.demo-test.k8s.local",
] # List of existing IAM policies that will be attached to instance profile for master nodes (EC2 instances)

k8s_node_count = "3" # Number of worker nodes in Kubernetes cluster

k8s_node_instance_type = "m4.large" # Instance type (size) for worker nodes

k8s_nodes_iam_policies_arns = [
  "arn:aws:iam::210987654321:policy/nodes.demo-test.k8s.local",
] # List of existing IAM policies that will be attached to instance profile for worker nodes (EC2 instances)

k8s_private_subnets = ["subnet-XXXX", "subnet-ZZZZ", "subnet-YYYY"] # List of private subnets (matching AZs) where to deploy the cluster (required if existing VPC is used)

k8s_aws_ssh_keypair_name = "" # Optional name of existing SSH keypair on AWS account, to be used for cluster instances (will be generated if not specified)

logs_not_resource = [] # List of resources that log police will use for NotResource, empty means that Resource * is set

operations_aws_account_number = "123456789012" # AWS operations account number (without hyphens)

product_domain_name = "demo" # Name of product domain, will be used to create other names

region = "eu-central-1" # AWS region

vpc_id = "vpc-XXXXXX" # ID of existing VPC (must be pre-created)
