/******************************************
	Subnet configuration
 *****************************************/

resource "google_compute_subnetwork" "subnet" {
	project = var.project_id	
	name = var.subnet_name
    ip_cidr_range = var.subnet_cidr_range
    network = var.network_name	 # google_compute_network.vpc-network.self_link
    region = var.region
    private_ip_google_access = var.private_ip_google_access
  
}