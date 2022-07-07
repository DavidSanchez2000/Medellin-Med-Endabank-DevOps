output "network" {
  value       = google_compute_network.vpc_network
  description = "The VPC resource being created"
}

output "network-name" {
  value       = google_compute_network.vpc_network.name
  description = "The name of the VPC being created"
}
output "network-id" {
  value       = google_compute_network.vpc_network.id
  description = "The ID of the VPC being created"
}

output "network-self-link" {
  value       = google_compute_network.vpc_network.self_link
  description = "The URI of the VPC being created"
}

output "project-id" {
  value       = google_compute_network.vpc_network.project
  description = "VPC project id"
}