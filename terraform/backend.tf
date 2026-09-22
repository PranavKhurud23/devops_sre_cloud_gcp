terraform {
  backend "gcs" {
    bucket = "project-3abb875e-b867-4aaf-843-tfstate"
    prefix = "terraform/state"
  }
}
