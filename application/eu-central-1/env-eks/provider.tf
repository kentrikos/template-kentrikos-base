# Parameters to set externally:
# * AWS region (e.g. by exporting AWS_DEFAULT_REGION env variable)
# * cross-account role ARN (via variable)

provider "aws" {
  # assume_role {  #   role_arn = "${var.iam_cross_account_role_arn}"  # }
  version = "~> 2.33.0"
  region  = var.region
}

