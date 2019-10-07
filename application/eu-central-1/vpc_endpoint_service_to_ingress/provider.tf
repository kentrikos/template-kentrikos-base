# Parameters to set externally:
# * AWS region (e.g. by exporting AWS_DEFAULT_REGION env variable)

provider "aws" {
  version = "~> 2.29.0"
  region  = var.region
}

