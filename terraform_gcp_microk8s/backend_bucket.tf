resource "google_storage_bucket" "test_terraform" {
  name          = "test-terraform"
  location      = "EU"
  force_destroy = true
  versioning {
    enabled = false
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_compute_backend_bucket" "test_tfstate" {
  name        = "test-tfstate"
  bucket_name = google_storage_bucket.test_terraform.name
  enable_cdn  = true
}
