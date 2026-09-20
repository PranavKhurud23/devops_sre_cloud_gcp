output "cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "The IP address of the GKE cluster master"
  value       = google_container_cluster.primary.endpoint
}

output "ca_certificate" {
  description = "The public cluster certificate for authentication"
  value       = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  sensitive   = true
}
