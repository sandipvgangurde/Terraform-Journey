

resource "google_compute_network" "auto_create" {
  name                    = "auto-create-vpc-tf"
  auto_create_subnetworks  = true
}

resource "google_compute_network" "custom_creation" {
  name                    = "custom-create-vpc-tf"
  auto_create_subnetworks  = false
}

resource "google_compute_subnetwork" "sub_sg" {
  name                     = "custom-subnet"
  network                  = google_compute_network.custom_creation.id
  ip_cidr_range            = "10.1.0.0/21"
  region                   = "asia-southeast1"
  private_ip_google_access = true
}
