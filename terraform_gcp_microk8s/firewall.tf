resource "google_compute_firewall" "test_default_firewall" {
  name    = "test-default-firewall"
  network = google_compute_network.test_default_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "sctp"
    ports    = ["0-65535"]
  }

  source_ranges = ["0.0.0.0/0", "10.158.0.0/20"]
}
