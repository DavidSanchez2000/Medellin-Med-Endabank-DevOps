resource "google_compute_instance" "default" {
    name = var.instance_name
    zone = var. instance_zone
    tags = var.tags
    can_ip_forward = var.can_ip_forward
    machine_type = var.instance_type
    allow_stopping_for_update = var.allow_stopping_for_update
    boot_disk {
      initialize_params {
          image = var.instance_image
      }
    }
   
     network_interface {
        subnetwork = var.subnetwork 
    }
    #metadata_startup_script = file(var.script_instances)

}
