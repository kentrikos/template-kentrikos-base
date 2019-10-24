output "vpces_service_name" {
  description = "Name of VPC Endpoint Service"
  value       = module.vpc-endpoint-services-to-ingress.vpces_service_name
}

output "vpces_base_endpoint_dns_names" {
  description = "The DNS names for the VPC Endpoint Service"
  value       = module.vpc-endpoint-services-to-ingress.vpces_base_endpoint_dns_names
}

