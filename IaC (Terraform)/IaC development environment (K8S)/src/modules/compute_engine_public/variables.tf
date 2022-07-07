variable "instance_name" {
    description = "name of the instance"
    type = string

}

variable "instance_zone" {
    description = "zone of the network that are asing to the instance"
    type = string
  
}

variable "tags" {
    description = "tags for firewall rule"
    type = list(string)
    default = []
  
}
variable "instance_type" {
    description = "type of instance"
    type = string
  
}

variable "allow_stopping_for_update" {
    description = "stopping updates"
    type = bool
    default = true
  
}

variable "instance_image" {
    description = "image of the OS that is asign to the instance"
    type = string
  
}

variable "subnetwork" {
    description = "subnetwork asing to the intance"
    type = string
}

variable "script" {
    description = "script file"
    type = string
}