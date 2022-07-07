variable "router_name" {
    description = "name of cloud router" 
    type = string
}

variable "subnet_region" {
    description = "region of subnet"
    type = string
  
}

variable "network_id" {
  description = "id of the VPC network"
  type = string
}

variable "nat_name" {
    description = "NAT name"
    type = string
  
}

variable "source_subnet_id" {
    description = "source subnet name from output"
    type = string
  
}