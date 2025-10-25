
# Define the required providers and their versions
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

# Configure the Google Cloud provider with your Project ID
provider "google" {
  # IMPORTANT: Replace "YOUR_PROJECT_ID" with your actual GCP Project ID
  project     = "YOUR_PROJECT_ID"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "file name"
}


terraform {

  backend "gcs" {

    bucket = "state-file-remotestorage-tf"
    prefix = "./"
  }
}
