provider "google" {
    credentials = var.GCP_SERVICES
    project = var.project
    region = var.region
    zone = var.zone
}

provider "google-beta" {
    credentials = var.GCP_SERVICES
    project = var.project
    region = var.region
    zone = var.zone
  
}