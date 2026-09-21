output "vpc_id" {
  value       = google_compute_network.custom_vpc.id
  description = "The URI / ID of the created custom VPC"
}

output "vpc_name" {
  value       = google_compute_network.custom_vpc.name
  description = "The exact name of the created VPC"
}

output "subnet_id" {
  value       = google_compute_subnetwork.custom_subnet.id
  description = "The URI / ID of the created subnetwork"
}

output "subnet_name" {
  value       = google_compute_subnetwork.custom_subnet.name
  description = "The exact name of the subnetwork"
}

output "pod_range_name" {
  value       = google_compute_subnetwork.custom_subnet.secondary_ip_range[0].range_name
  description = "The secondary IP range name used for GKE Pods"
}

output "svc_range_name" {
  value       = google_compute_subnetwork.custom_subnet.secondary_ip_range[1].range_name
  description = "The secondary IP range name used for GKE Services"
}
