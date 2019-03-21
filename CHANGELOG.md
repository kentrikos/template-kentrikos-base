# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- Adjustments to config repo change
   ```
   operations/$REGION/env -> operations/$REGION/env-kops
                          -> operations/$REGION/env-eks
   
   application/$REGION/env -> application/$REGION/env-kops
                           -> application/$REGION/env-eks
   ```

## [0.3.2] - 2019-03-20
## Changed
- Updated `terraform-aws-operations-account` module to v0.3.1
- Updated `terraform-aws-application-account` module to v0.3.1
## Added
- Inputs to enable autoscaling features of deployed cluster
- Input to enable helm installation
- Input for cluster tagging on cluster (Application environment)

## [0.3.1] - 2019-03-11
## Changed
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


