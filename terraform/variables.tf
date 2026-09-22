variable "project_id" {
  description = "Define project-id"
  type        = string
}

variable "region" {
  description = "Define region"
  type        = string
  default     = "asia-south1"
}

variable "env" {
  description = "Define env"
  type        = string
  default     = "dev"
}

# --- GKE Variables ---

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "devops-gke-cluster"
}

variable "master_ipv4_cidr_block" {
  description = "IP CIDR block for GKE master control plane"
  type        = string
  default     = "172.16.0.0/28"
}

variable "node_count" {
  description = "Number of worker nodes per zone"
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "Machine type for worker nodes"
  type        = string
  default     = "e2-medium"
}
