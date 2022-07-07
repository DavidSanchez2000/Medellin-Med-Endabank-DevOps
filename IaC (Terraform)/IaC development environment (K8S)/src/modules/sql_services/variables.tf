
/*****************************
variable "provider" {
    description = "provider"
    type = string
    default = "google-beta"
  
}
*******************************/
/*
variable "private_network_name" {
    description = "name of the private network used for the database"
    type = string
}

variable "routing_mode" {
    description = "routing mode scope"
    type = string
    default = "GLOBAL"
}

*/

/*
variable "auto_create_subnetworks" {
    description = "in needed auto created subnets?"
    type = bool
    default = true
  
}
*/

variable "private_ip_name" {
    description = "name for the private IP"
    type = string
}

variable "purpose" {
    description = "database purpose"
    type = string
    #default = "VPC_PEERING"
}

variable "address_type" {
    description = "addres type"
    type = string
    #default = "INTERNAL"
  
}

variable "private_ip_address_version" {
    description = "ip version"
  
}
variable "prefix_length" {
    description = "prefix lenght"
    type = number
    #default = 16
}

variable "private_network_name_ip_address" {
    description = "IP addres network"
    type = string


}
variable "network_name" {
    description = "network" #google_compute_network.private_network.self_link
  
}

variable "service" {
    description = "network service"
    type = string
    #default = "servicenetworking.googleapis.com"
  
}

variable "reserved_peering_ranges" {
    description = "reserved peering ranges" #[google_compute_global_address.private_ip_address.name]
  
}

variable "database_name" {
    description = "name of database"
    type = string
  
}

variable "database_instance" {
    description = "database primary instance"
    type = string
  
}

variable "database_instance_name" {
    description = "database instance name"
    type = string
  
}

variable "database_region" {
    description = "region of database location"
    type = string
    #default = "us-central1"
}

variable "database_version" {
    description = "data base version"
    type = string
    #default = "POSTGRES_13"
  
}

variable "deletion_protection" {
    description = "is the delection protection enabled or disabled"
    type = bool
    default = false
  
}

variable "depends_on_database" {
    description = "dependence" #google_service_networking_connection.private_vpc_connection
    
}

variable "database_tier" {
    description = "tier type"
    default = "db-g1-small"
}

variable "availability_type" {
    description = "avalability type" 
    type = string
    #default = "REGIONAL"

}

variable "disk_size" {
    description = "size of database disk"
    type = number
    default = 10
  
}

variable "database_backup" {
    description = "is backup enabled?"
    type = bool
  
}

variable "ipv4_enabled" {
    description = "the database need a public ip?"
    type = bool
    default = false
  
}

variable "private_network_instance" {
    description = "the private network of the database" #google_compute_network.private_network.self_link
  
}

variable "database_user_name" {
    description = "username of the database"
    type = string
    #default = "root"
    sensitive = true
}

variable "database_instance_credentials" {
    description = "database instance credentiasl"
    type = string
  
}

variable "database_password" {
    description = "password of database"
    type = string
    #default = "admin"
    sensitive = true
  
}

