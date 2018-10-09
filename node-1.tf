resource "google_compute_address" "node_one_address" {
  name         = "node-1-address"
  subnetwork   = "${module.network_development.subnetwork_west}"
  address_type = "INTERNAL"
  address      = "10.1.0.3"
}

resource "google_compute_address" "node_one_public_address" {
  name = "node-1-public"
}

resource "google_compute_instance" "node_one" {
  name         = "node-1"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-bionic-v20180814"
    }
  }

  network_interface {
    subnetwork = "${module.network_development.subnetwork_west}"
    address = "${google_compute_address.node_one_address.address}"

    access_config {
      nat_ip = "${google_compute_address.node_one_public_address.address}"
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
