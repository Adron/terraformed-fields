resource "google_compute_address" "node_address" {
  name         = "${var.node_address_name}"
  subnetwork   = "${var.node_subnetwork}"
  address_type = "INTERNAL"
  address      = "${var.node_ip}"
}

resource "google_compute_instance" "nodezero" {
  name         = "${var.node_name}"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-bionic-v20180814"
    }
  }

  network_interface {
    subnetwork = "${var.node_subnetwork}"
    address    = "${google_compute_address.node_address.address}"
  }

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro",
    ]
  }
}
