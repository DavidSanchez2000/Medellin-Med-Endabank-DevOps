output "subnet" {
  value = google_compute_subnetwork.subnet
  description = "The created subnet resource"
}

output "subnet-region" {
    value = google_compute_subnetwork.subnet.region
}

output "subnet-id" {
    value = google_compute_subnetwork.subnet.id
}