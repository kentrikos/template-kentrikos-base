# AWS region must be set externally, e.g. by exporting AWS_DEFAULT_REGION env variable

provider "aws" {
  region  = "${var.region}"
  version = "~> 1.60"
}
