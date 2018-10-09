resource "google_compute_instance" "node_zero" {
  name         = "${var.node_name}"
  machine_type = "n1-standard-1"
  zone         = "${var.node_zone}"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-bionic-v20180814"
    }
  }

  network_interface {
    subnetwork = "${var.subnetwork}"
    address    = "${google_compute_address.node_zero_address.address}"
  }

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro",
    ]
  }

  provisioner "local-exec" {
    command = "echo 'Installing.' && sudo apt-get update"
  }
}
