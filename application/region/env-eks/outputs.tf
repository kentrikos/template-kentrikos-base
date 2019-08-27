output "cluster_id" {
  value = module.application.cluster_id
}

output "worker_iam_role_name" {
  value = module.application.worker_iam_role_name
}

output "workers_asg_names" {
  description = "Names of the autoscaling groups containing workers."
  value       = module.application.workers_asg_names
}

output "ingress_service_nodeport_http" {
  description = "Port number for ingress"
  value       = module.application.ingress_service_nodeport_http
}

