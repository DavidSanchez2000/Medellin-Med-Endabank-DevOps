variable "fw_name" {
    description = "Firewall-rule name"
    type = string
  
}

variable "network" {
    description = "network name"
    type = string 
  
}

variable "description" {
    description = "optional description of resource"
    type = string 

}

variable "source_ranges" {
  description = "ingress source ip range"
  type = list(string)
  default = []

}

variable "protocol" {
    description = "protocol type"
    type = string
  
}

variable "ports" {
    description = "allow ingress ports"
    type = list(string)
    default = []

}


variable "target_tags" {
    description = "allow target tags"
    type = list(string)
    default = []

}