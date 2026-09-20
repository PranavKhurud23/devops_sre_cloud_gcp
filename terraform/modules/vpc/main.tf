resource "google_compute_network" "custom_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "custom_subnet" {
  name          = "${var.vpc_name}-subnet"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.custom_vpc.id

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = var.pods_cidr
  }

  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = var.services_cidr
  }
}
