resource "google_storage_bucket" "static-site" {
    
    name          = var.bucket_name
    project       = var.project_id
    location      = var.bucket_region
    force_destroy = var.bucket_force_destroy

    uniform_bucket_level_access = var.uniform_bucket_level_access

    website {
        main_page_suffix = var.bucket_main_page_suffix
        not_found_page   = var.bucket_not_page_found
    }
    cors {
        origin          = var.bucket_origin
        method          = var.bucket_method
        response_header = var.bucket_response_header
        max_age_seconds = var.bucket_max_age_seconds
    }
}

