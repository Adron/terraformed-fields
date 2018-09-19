resource "google_compute_address" "node3_internal" {
  name         = "node-3-internal"
  subnetwork   = "${google_compute_subnetwork.dev-sub-west1.self_link}"
  address_type = "INTERNAL"
  address      = "10.1.0.7"
}

resource "google_compute_instance" "node_susan" {
  name         = "susan"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-bionic-v20180814"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.dev-sub-west1.self_link}"
    address    = "${google_compute_address.node3_internal.address}"
  }

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro",
    ]
  }
}
