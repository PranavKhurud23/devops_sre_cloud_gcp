variable "project_id" {
   description = "Define project-id"
   type = string
}
variable "region" {
  description = "Define region"
  type = string
  default = "asia-south1"
}
variable "env" {
  description = "Define env"
  type = string
  default = "dev"
}
