variable "project_id" {
    description = " Project Id that are allows the infraestructure" 
}



variable "subnet_name" {
    description = "name of created subnet"
    type = string
    default = "default-name"

}

variable "subnet_cidr_range" {
    description = "subnet cidr range"
    type = string
    default = "10.0.0.0/24"

}

variable "network_name" {
  description = "The name of the network where subnets will be created"
}

variable "region" {
    description = "subnet region"
    type = string
  
}

variable "private_ip_google_access" {
    description = "private ip acces or no?"
    type = bool
    default = false
}