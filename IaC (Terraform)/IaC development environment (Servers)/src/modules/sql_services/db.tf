# ------------------------------------------------------------------------------
# LAUNCH A POSTGRES CLOUD SQL PRIVATE IP INSTANCE
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# CREATE COMPUTE NETWORKS
# ------------------------------------------------------------------------------

# Reserve global internal address range for the peering
resource "google_compute_global_address" "private_ip_address" {
    #provider = var.provider
    name          = var.private_ip_name
    purpose       = var.purpose
    address_type  = var.address_type
    ip_version = var.private_ip_address_version
    prefix_length = var.prefix_length
    network       = var.private_network_name_ip_address #google_compute_network.private_network.self_link
}

# Establish VPC network peering connection using the reserved address range
resource "google_service_networking_connection" "private_vpc_connection" {
   #provider = var.provider
    network                 = var.network_name #google_compute_network.private_network.self_link
    service                 = var.service
    reserved_peering_ranges = var.reserved_peering_ranges #[google_compute_global_address.private_ip_address.name]
}

# ------------------------------------------------------------------------------
# CREATE DATABASE INSTANCE WITH PRIVATE IP
# ------------------------------------------------------------------------------

resource "google_sql_database" "database" {
    #provider = var.provider
    name = var.database_name
    instance = var.database_instance # google_sql_database_instance.database_primary.name

}

resource "google_sql_database_instance" "database_primary" {
    #provider = var.provider
    name = var.database_instance_name
    region = var.database_region
    database_version = var.database_version
    deletion_protection = var.deletion_protection
    depends_on = [
      var.depends_on_database#google_service_networking_connection.private_vpc_connection
    ]
    settings {
        tier = var.database_tier
        availability_type = var.availability_type
        disk_size = var.disk_size
    backup_configuration {
        enabled = var.database_backup
    }
        ip_configuration{
            ipv4_enabled = var.ipv4_enabled 
            private_network = var.private_network_instance #google_compute_network.private_network.self_link
        }
        
    }
}

resource "google_sql_user" "database_user" {
 name = var.database_user_name
 instance = var.database_instance_credentials  #google_sql_database_instance.database_primary.name
 password = var.database_password 
}
