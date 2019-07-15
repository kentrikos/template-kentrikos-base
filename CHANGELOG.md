# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.10.0] - 2019-07-15
### Changed
- Bump application account module to 0.6.0
- Bump operations account module to 0.5.0

### Added
- Added configs for mapping users/roles/accounts to IAM access to k8s

## [0.9.0] - 2019-06-14
### Added
- Added configs for alertmanager in all env-* dirs. 

### Changed
- Bump Jenkins core infra to 0.9.0

## [0.8.1] - 2019-05-27
### Changed
- Bump Jenkins core infra to 0.8.1 
- Bump application account module to 0.5.1

### Fixed
- Add missing k8s_allowed_worker_nodeport_cidrs var to application tfvars

## [0.8.0] - 2019-05-22
### Added
- Configuration for Kubernetes Ingress and associated VPC Endpoint Service

## [0.7.0] - 2019-05-15
### Added
- input for operations and application account infrastructure
- incremented Jenkins Core version to 0.7.0
- Added logging modules for app and ops accounts 

### Changed
- Updated jenkins core infra module to 0.6.1

## [0.6.1] - 2019-04-16
- Solved gp2 storage creation in EKS module

## [0.6.0] - 2019-04-15
### Added
- Set Terraform AWS provider to v2.5.0 to support EKS module v2.3.1
- Set Terraform AWS provider to v2.5.0 to all modules
- Set link to higher version of account repos --> v0.4.0

### Changed
- Updated jenkins core infra module to 0.6.0

## [0.5.0] - 2019-04-01
### Added
- Added new parameter for R53 HostedZoneID

### Changed
- Updated jenkins core infra module to 0.5.1

## [0.4.1] - 2019-03-26
### Fixed
- Added missing configs to env-eks for grafana 

## [0.4.0] - 2019-03-26
### Changed
- Adjustments to config repo change
   ```
   operations/$REGION/env -> operations/$REGION/env-kops
                          -> operations/$REGION/env-eks
   
   application/$REGION/env -> application/$REGION/env-kops
                           -> application/$REGION/env-eks
   ```
- Pined new versions for modules
- Updated jenkins core module to 0.4.2 with fixed job names

## [0.3.2] - 2019-03-20
### Changed
- Updated `terraform-aws-operations-account` module to v0.3.1
- Updated `terraform-aws-application-account` module to v0.3.1
### Added
- Inputs to enable autoscaling features of deployed cluster
- Input to enable helm installation
- Input for cluster tagging on cluster (Application environment)

## [0.3.1] - 2019-03-11
### Changed
- Updated `terraform-aws-bootstrap-jenkins` module to v0.3.1

## [0.3.0] - 2019-03-07
### Changed
- Added input variable in operations for no_proxy configuration
- Operations account update to 0.3.0 (eks cluster support)
- Application account update to 0.3.0 (eks cluster support)
- Removed `assume_role` from provider configuration in application env. (terraform null_resource execution does not honor)
- Updated Jenkins Core to version 0.3.0

## [0.2.1] - 2019-03-01
### Changed
- Fix description and examples for HTTP proxy parameters
- Jenkins core infra update to 0.2.3

### Fixed
- Pin aws provider to version 1.60 due to incompatibility with 2.0.0, GH-16

### Fixed
- Pin aws provider to version 1.60 due to incompatibility with 2.0.0, GH-16

## [0.2.0] - 2019-02-25
### Backwards Incompatibilities / Notes
- Changes in IAM policies in Application account for k8s
    
    From:
   ```hcl
    # Masters: 
    #   arn:aws:iam::{application_aws_account_number}:policy/masters.{product_domain_name}-{environment_type}.k8s.local
    #   arn:aws:iam::{application_aws_account_number}:policy/masters_extra.{product_domain_name}-{environment_type}.k8s.local
    # Nodes: 
    #   arn:aws:iam::{application_aws_account_number}:policy/nodes.{product_domain_name}-{environment_type}.k8s.local
   ```
   To:
   ```hcl
    # Masters: 
    #   arn:aws:iam::{application_aws_account_number}:policy/masters.{region}-{product_domain_name}-{environment_type}.k8s.local
    #   arn:aws:iam::{application_aws_account_number}:policy/masters_extra.{region}-{product_domain_name}-{environment_type}.k8s.local
    # Nodes: 
    #   arn:aws:iam::{application_aws_account_number}:policy/nodes.{region}-{product_domain_name}-{environment_type}.k8s.local
   ```
- Changes in IAM policies in Operations account for k8s
  From:
   ```hcl
    # Masters: 
    #   arn:aws:iam::{operations_aws_account_number}:policy/masters.{product_domain_name}-{environment_type}-ops.k8s.local
    #   arn:aws:iam::{operations_aws_account_number}:policy/masters_extra.{product_domain_name}-{environment_type}-ops.k8s.local
    # Nodes: 
    #   arn:aws:iam::{operations_aws_account_number}:policy/nodes.{product_domain_name}-{environment_type}-ops.k8s.local
    #   arn:aws:iam::{operations_aws_account_number}:policy/AssumeKopsCrossAccount"
   ```
   To:
   ```hcl
    # Masters: 
    #   arn:aws:iam::{operations_aws_account_number}:policy/masters.{region}-{product_domain_name}-{environment_type}-ops.k8s.local
    #   arn:aws:iam::{operations_aws_account_number}:policy/masters_extra.{region}-{product_domain_name}-{environment_type}-ops.k8s.local
    # Nodes: 
    #   arn:aws:iam::{operations_aws_account_number}:policy/nodes.{region}-{product_domain_name}-{environment_type}-ops.k8s.local
    #   arn:aws:iam::{operations_aws_account_number}:policy/KENTRIKOS_{region}.{product_domain_name}-{environment_type}_AssumeCrossAccount"
  
   ```
- All modules point to version 0.2.0 - need adjustments 

### Changed
- Rewrite configs to support multi deployment

### Added
- Backend to IAM generator to s3

## [0.1.0] - 2019-02-05
### Added
- Pining versions
- This CHANGELOG file


