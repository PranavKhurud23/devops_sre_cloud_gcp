output "vpc_id" {
  description = "The ID of the created VPC network"
  value       = google_compute_network.custom_vpc.id
}

output "subnet_id" {
  description = "The ID of the created subnetwork"
  value       = google_compute_subnetwork.custom_subnet.id
}

output "subnet_name" {
  description = "The name of the created subnetwork"
  value       = google_compute_subnetwork.custom_subnet.name
}

output "pod_range_name" {
  description = "The secondary range name for pods"
  value       = google_compute_subnetwork.custom_subnet.secondary_ip_range[0].range_name
}

output "svc_range_name" {
  description = "The secondary range name for services"
  value       = google_compute_subnetwork.custom_subnet.secondary_ip_range[1].range_name
}
