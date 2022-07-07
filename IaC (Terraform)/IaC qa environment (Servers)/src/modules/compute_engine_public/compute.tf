resource "google_compute_instance" "default" {
    name = var.instance_name
    zone = var. instance_zone
    tags = var.tags
    machine_type = var.instance_type
    allow_stopping_for_update = var.allow_stopping_for_update
    boot_disk {
      initialize_params {
          image = var.instance_image
      }
    }
    #tags = ["${concat(list("${var.name}-ssh", "${var.name}"), var.node_tags)}"]
     network_interface {
        subnetwork = var.subnetwork 
        access_config{
            //Ephemeral IP
        }
    }
    metadata_startup_script = file(var.script)
}