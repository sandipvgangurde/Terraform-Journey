
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"

    }
  }


  retention_policy {
    is_locked        = true
    retention_period = 86400


  }


}


resource "google_storage_bucket_object" "filee" {
  name   = "new-name"
  source = "./key-tf.json"
  bucket = google_storage_bucket.GCS1.name
