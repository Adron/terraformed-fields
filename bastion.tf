resource "google_compute_address" "bastion_a" {
  name = "bastion-a"
}

resource "google_compute_instance" "bastion" {
  name         = "bastion"
  machine_type = "f1-micro"
  zone         = "us-west1-a"

  // provisioner "file" {
  // source      = "install-c.sh"
  // destination = "install-c.sh"

  // connection {
  //   type     = "ssh"
  //   user     = "root"
  //   password = "${var.root_password}"
  //   }
  // }

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-bionic-v20180814"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.dev-sub-west1.self_link}"
    access_config {
      nat_ip = "${google_compute_address.bastion_a.address}"
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
