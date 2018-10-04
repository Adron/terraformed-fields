resource "google_compute_address" "node0_internal" {
  name         = "node-0-internal"
  subnetwork   = "${var.subnetwork}"
  address_type = "INTERNAL"
  address      = "${var.ip}"
}

resource "google_compute_instance" "node_zero" {
  name         = "charlieone"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-bionic-v20180814"
    }
  }

  network_interface {
    subnetwork = "${var.subnetwork}"
    address    = "${google_compute_address.node0_internal.address}"
  }

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro",
    ]
  }
}
