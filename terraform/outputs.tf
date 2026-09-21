output "gke_cluster_name" {
  value       = module.gke_cluster.cluster_name
  description = "The name of the GKE cluster"
}

output "gke_cluster_endpoint" {
  value       = module.gke_cluster.cluster_endpoint
  description = "The endpoint for the GKE cluster"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the created VPC"
}
