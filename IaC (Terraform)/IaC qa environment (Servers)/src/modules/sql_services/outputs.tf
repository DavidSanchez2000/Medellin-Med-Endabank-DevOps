output "database" {
    description = "database"
    value = google_sql_database.database.self_link
}

output "database-name" {
    description = "name of database"
    value = google_sql_database_instance.database_primary.name
} 

output "reserved-peering-ranges" {
    description = "Private ip network name"
    value = [google_compute_global_address.private_ip_address.name]
  
}

output "depends-on-database" {
    description = "depend connection for database "
    value = [google_service_networking_connection.private_vpc_connection]
}