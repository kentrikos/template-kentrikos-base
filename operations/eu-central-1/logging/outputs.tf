output "elasticsearch_endpoint" {
  value = "${module.elasticsearch_logging.elasticsearch_endpoint}"
}

output "kibana_endpoint" {
  value = "${module.elasticsearch_logging.kibana_endpoint}"
}

output "iam_role_arn" {
  value = "${module.elasticsearch_logging.iam_role_arn}"
}
