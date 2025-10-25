resource "google_compute_instance" "vm-tf" {



  name                      = "new-vm4-from-tf"
  zone                      = "asia-southeast1-a"
  machine_type              = "e2-standard-2"
  allow_stopping_for_update = true


  network_interface {
    network    = "default"
    subnetwork = "default"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2510-questing-amd64-v20251007"
      size  = 20
    }
  }


  labels = {
    "env" = "tf-learning"
  }

  lifecycle {
    ignore_changes = [
      attached_disk
    ]
 
 }
}

