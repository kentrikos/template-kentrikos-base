output "cluster_id" {
  value = "${module.application.cluster_id}"
}

output "worker_iam_role_name" {
  value = "${module.application.worker_iam_role_name}"
}
