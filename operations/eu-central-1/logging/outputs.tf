output "elasticsearch_endpoint" {
  value = "${module.elasticsearch.endpoint}"
}

output "repository_url" {
  value = "${module.fluentd_elasticsearch_image.repository_url}"
}

output "image_tag" {
  value = "${module.fluentd_elasticsearch_image.image_tag}"
}

output "iam_role_arn" {
  value = "${aws_iam_role.operations_logging_role.arn}"
}
