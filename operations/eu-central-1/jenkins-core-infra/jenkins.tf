module "jenkins" {
  source = "github.com/kentrikos/terraform-aws-bootstrap-jenkins?ref=multi_deployment"

  operations_aws_account_number  = "${var.operations_aws_account_number}"
  application_aws_account_number = "${var.application_aws_account_number}"

  product_domain_name = "${var.product_domain_name}"
  environment_type    = "${var.environment_type}"
  ec2_instance_type   = "${var.jenkins_ec2_instance_type}"

  vpc_id                  = "${var.vpc_id}"
  subnet_id               = "${var.jenkins_subnet_id}"
  http_proxy              = "${var.http_proxy}"
  jenkins_proxy_http_port = "${var.http_proxy_port}"

  jenkins_dns_domain_hosted_zone_ID = "${var.jenkins_dns_domain_hosted_zone_ID}"
  jenkins_dns_hostname              = "${var.jenkins_dns_hostname}"

  ssh_allowed_cidrs  = "${var.jenkins_ssh_allowed_cidrs}"
  http_allowed_cidrs = "${var.jenkins_http_allowed_cidrs}"

  jenkins_config_repo_url = "${var.jenkins_config_repo_url}"

  iam_policy_names_prefix = "${var.jenkins_iam_policy_names_prefix}"

  auto_IAM_mode = "${var.auto_IAM_mode}"
  region        = "${var.region}"
}
