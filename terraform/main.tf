terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Call VPC Module
module "vpc" {
  source        = "./modules/vpc"
  vpc_name      = "${var.env}-custom-vpc"
  region        = var.region
  subnet_cidr   = "10.10.0.0/20"
  pods_cidr     = "10.20.0.0/16"
  service_cidr  = "10.30.0.0/20"
}

# Call GKE Module
module "gke_cluster" {
  source       = "./modules/gke_cluster"
  region       = var.region
  vpc_id       = module.vpc.vpc_id
  subnet_id    = module.vpc.subnet_id
  node_count   = 2
  machine_type = "e2-medium"
}
