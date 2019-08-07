# Parameters to set externally:
# * cross-account role ARN (via variable)

provider "aws" {
  assume_role {
    role_arn = var.iam_cross_account_role_arn
  }

  region  = var.region
  version = "~> 2.20.0"
}

