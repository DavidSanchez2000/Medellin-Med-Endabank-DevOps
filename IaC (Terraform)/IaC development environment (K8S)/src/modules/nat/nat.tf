resource "google_compute_router" "router" {
  name    = var.router_name
  region = var.subnet_region
  network = var.network_id  # google_compute_network.net.id
  bgp {
    asn               = 64514
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]

  }
}

resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = google_compute_router.router.name #var.router_name
  region                             = google_compute_router.router.region #var.subnet_region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name = var.source_subnet_id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

#google_compute_subnetwork.subnet.id