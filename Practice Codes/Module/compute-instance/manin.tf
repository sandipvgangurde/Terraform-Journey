resource "google_compute_instance" "vm" {

name = var.instance_name
machine_type = var.machine_type
zone = var.zone

boot_disk {

initialize_params {
image = var.image
}
}

network_interface {

network    = var.network
subnetwork = var.subnetwork
access_config {}

}

tags = var.tags

}
