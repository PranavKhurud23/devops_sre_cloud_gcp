variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "devops-gke-cluster"
}
variable "project_id" {
  description = "The GCP Project ID"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "The GCP region for the cluster"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC network"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnetwork"
  type        = string
}

variable "pod_range_name" {
  description = "The secondary range name for pods"
  type        = string
}

variable "svc_range_name" {
  description = "The secondary range name for services"
  type        = string
}

variable "node_count" {
  description = "Initial node count per zone"
  type        = number
  default     = 1
}

variable "master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation to use for the GKE master control plane"
  type        = string
  default     = "172.16.0.0/28"
}

variable "machine_type" {
  description = "Machine type for cluster nodes"
  type        = string
  default     = "e2-medium"
}
