resource "google_compute_network" "new-custom-network" {
  name                    = "custom-vpc-tf"
  auto_create_subnetworks = false


}

resource "google_compute_subnetwork" "custom_subnet" {

  name          = "custom-subnet-tf"
  ip_cidr_range = "10.10.0.0/24"
  region        = "asia-south1"
  network       = google_compute_network.new-custom-network.id

  depends_on = [google_compute_network.new-custom-network]

}


resource "google_compute_firewall" "allow-ssh" {

  name    = "allow-ssh-tf"
  network = google_compute_network.new-custom-network.name

  allow {

    protocol = "tcp"
    ports    = ["22"]

  }

  source_ranges = ["0.0.0.0/0"]

  depends_on = [google_compute_subnetwork.custom_subnet]

}


resource "google_compute_instance" "vm-depends-on" {
  name         = "vm-depend-on-tf"
  machine_type = "e2-standard-2"

  zone = "asia-south1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2510-questing-amd64-v20251007"
      size  = 20

    }

  }


  network_interface {
    subnetwork = google_compute_subnetwork.custom_subnet.id
    access_config {}

  }


  labels = {

    "k" = "v"
  }
  depends_on = [
    google_compute_firewall.allow-ssh,
    google_compute_subnetwork.custom_subnet
  ]
}
