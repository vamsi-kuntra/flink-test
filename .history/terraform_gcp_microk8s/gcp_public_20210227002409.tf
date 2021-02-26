resource "google_compute_instance" "control_instance" {
  name         = "control-instance"
  machine_type = var.gcp_machine_type_id.e2medium

  boot_disk {
    initialize_params {
      image = var.gcp_image_id.ubuntu
    }
  }

  metadata = {
    user-data = file("./cloud_init/ubuntu-control-microk8s.yml")
  }

  network_interface {
    network    = google_compute_network.test_default_vpc.self_link
    network_ip = "10.158.0.2"
    access_config {
    }
  }

}

resource "google_compute_instance" "cargo_instance" {
  count        = var.gcp_cargo_count
  name         = "cargo00${count.index + 1}-instance"
  machine_type = var.gcp_machine_type_id.e2small
  depends_on   = [google_compute_instance.control_instance]

  boot_disk {
    initialize_params {
      image = var.gcp_image_id.ubuntu
    }
  }

  metadata = {
    user-data = file("./cloud_init/ubuntu-cargo-microk8s.yml")
  }

  network_interface {
    network = google_compute_network.microk8s_default_vpc.self_link
    access_config {
    }
  }

}
