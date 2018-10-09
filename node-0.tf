resource "google_compute_address" "node_zero_address" {
  name         = "node-0-address"
  subnetwork   = "${module.network_development.subnetwork_west}"
  address_type = "INTERNAL"
  address      = "10.1.0.2"
}

resource "google_compute_address" "node_zero_public_address" {
  name = "node-0-public"
}

resource "google_compute_instance" "node_zero" {
  name         = "node-0"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-bionic-v20180814"
    }
  }

  network_interface {
    subnetwork = "${module.network_development.subnetwork_west}"
    address = "${google_compute_address.node_zero_address.address}"

    access_config {
      nat_ip = "${google_compute_address.node_zero_public_address.address}"
    }
  }

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro",
    ]
  }
}
