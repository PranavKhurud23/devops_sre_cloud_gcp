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
  source       = "./modules/vpc"
  vpc_name     = "${var.env}-custom-vpc"
  region       = var.region
  subnet_cidr  = "10.10.0.0/20"
  pods_cidr    = "10.20.0.0/16"
  service_cidr = "10.30.0.0/20"
}

# Call GKE Module
module "gke_cluster" {
  source         = "./modules/gke_cluster"
  project_id     = var.project_id
  region         = var.region
  env            = var.env
  vpc_id         = module.vpc.vpc_id
  subnet_id      = module.vpc.subnet_id
  pod_range_name = module.vpc.pod_range_name
  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  svc_range_name = module.vpc.svc_range_name
  node_count     = 2
  machine_type   = "e2-medium"
}

# Provision the Docker Artifact Registry repository
resource "google_artifact_registry_repository" "expense_repo" {
  location      = "asia-south1"
  repository_id = "expense-repo"
  description   = "Docker repository for expense tracker application"
  format        = "DOCKER"
}

# Grant Artifact Registry Reader access to default compute service account
resource "google_project_iam_member" "gke_artifact_registry_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com"
}
