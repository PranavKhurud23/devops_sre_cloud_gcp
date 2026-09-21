output "gke_cluster_name" {
  value       = module.gke_cluster.kubernetes_cluster_name
  description = "The name of the GKE cluster"
}
output "gke_cluster_endpoint" {
  value       = module.gke_cluster.kubernetes_cluster_host
  description = "The endpoint for the GKE cluster"
}
output "vpc_name" {
  value       = module.vpc.vpc_name
  description = "The name of the created VPC"
}
