variable "vpc_name" {
  type        = string
  description = "Name of the Custom VPC netwrok"
}
variable "subnet_cidr" {
  type        = string
  description = "Primary UP CIDR range of subnetwork"
}
variable "pods_cidr" {
  type        = string
  description = "Secondary IP range of GKR PODS"
}
variable "service_cidr" {
  type        = string
  description = "Secndary IP CIDR range for GKR service"
}
variable "region" {
  type        = string
  description = "GCP region for subnet"
}
