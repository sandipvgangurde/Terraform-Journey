provider "google" {
  project = "cts01-reeni"
  region  = "asia-south1"
}

module "vpc_network" {
  source       = "../../modules/vpc-network"
  network_name = "dev-vpc"
  subnet_name  = "dev-subnet"
  region       = "asia-south1"
  subnet_cidr  = "10.0.1.0/24"
}


module "vm_instance" {
  source        = "../../modules/compute-instance"
  instance_name = "dev-vm-tf"
  machine_type  = "e2-standard-2"
  zone          = "asia-south1-a"
  image         = "ubuntu-minimal-2510-questing-amd64-v20251007"
  network       = module.vpc_network.network_name
  subnetwork   = module.vpc_network.subnet_name
  tags          = ["dev", "terraform"]

}
