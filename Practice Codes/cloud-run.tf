resource "google_cloud_run_service" "cloud-run-tf" {
  name     = "cloud-run-from-tf"
  location = "asia-southeast1"


  template {
    spec {
      containers {
        image = "gcr.io/google-samples/hello-app:1.0"
      }
    }
  }
}

resource "google_cloud_run_service_iam_policy" "for-access" {
  service     = google_cloud_run_service.cloud-run-tf.id
  location    = google_cloud_run_service.cloud-run-tf.id
  policy_data = data.google_iam_policy.policy-1.policy_data
}



data "google_iam_policy" "policy-1" {
  binding {
    role    = "roles/run.invoker"
    members = ["allUsers"]
  }
}
