resource "google_compute_firewall" "fw_rule" {
  name = var.fw_name
  network = var.network
  description = var.description
  source_ranges = var.source_ranges
  allow {
    protocol = var.protocol
    ports = var.ports
  }

  target_tags = var.target_tags

}