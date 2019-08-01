#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
set -o xtrace
## declare an array variable
declare -a arr=("operations/eu-central-1/env-eks"
  "operations/eu-central-1/iam"
  "operations/eu-central-1/jenkins-core-infra"
  "operations/eu-central-1/logging"
  "application/eu-central-1/env-eks"
  "application/eu-central-1/iam/auto"
  "application/eu-central-1/iam/manual"
  "application/eu-central-1/vpc_endpoint_service_k8s"
  "application/eu-central-1/logging"
)

## now loop through the above array
for i in "${arr[@]}"; do
  pushd "$i"
  terraform init -backend=false -upgrade
  terraform fmt -check=true
  terraform validate
  popd
done
