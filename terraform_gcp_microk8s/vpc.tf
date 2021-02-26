resource "google_compute_network" "test_default_vpc" {
  name                    = "test-default-vpc"
  auto_create_subnetworks = "true"
}
