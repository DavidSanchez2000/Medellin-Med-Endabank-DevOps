variable "bucket_name" {
    description = "name of bucket"
    type = string
  
}

variable "project_id" {
    description = "project id"
  
}


variable "bucket_region" {
    description = "bucket region"
    type = string
}

variable "bucket_force_destroy" {
    description = "bucket force destroy is enabled or disabled?"
    type = bool
  
}

variable "uniform_bucket_level_access" {
    description = "type of access control is uniform?"
    type = bool
}

variable "bucket_main_page_suffix" {
    description = "main page suffix of bucket"
    type = string
  
}

variable "bucket_not_page_found" {
    description = "page of not found"
    type = string
  
}

variable "bucket_origin" {
    description = "origin of bucket"
    type = list(string)
  
}

variable "bucket_method" {
    description = "methods of bucket"
    type = list(string)
  
}

variable "bucket_response_header" {
    description = "response header of bucket"
    type = list(string)
}

variable "bucket_max_age_seconds" {
    description = "max age seconds of bucket"
    type = number
}