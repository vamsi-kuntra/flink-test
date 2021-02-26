resource "google_compute_instance_group" "test_default_ig" {
  name        = "test-default-ig"
  description = "GCP test default ig"

  instances = [
    google_compute_instance.control_instance.id,
  ]

  named_port {
    name = "ssh"
    port = "22"
  }

  named_port {
    name = "http"
    port = "80"
  }

  named_port {
    name = "https"
    port = "443"
  }

  named_port {
    name = "dashboard"
    port = "10443"
  }

  named_port {
    name = "microk8s"
    port = "25000"
  }

  zone = var.gcp_zone_id[var.gcp_region]
}
