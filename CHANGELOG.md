# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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


