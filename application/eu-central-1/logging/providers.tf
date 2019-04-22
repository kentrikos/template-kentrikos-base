provider "aws" {
  region  = "${var.region}"
  version = "~> 2.5.0"
}

provider "helm" {
  alias           = "logging"
  install_tiller  = false
  service_account = "${var.tiller_service_account}"

  kubernetes {
    config_context = "${var.cluster_context}"
  }
}
