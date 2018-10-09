resource "google_compute_address" "bastion_addy" {
  name = "bastion-a"
}

resource "google_compute_instance" "the_bastion" {
  provisioner "file" {
    source      = "install-c.sh"
    destination = "install-c.sh"
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }

  name         = "the-bastion"
  machine_type = "f1-micro"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-bionic-v20180814"
    }
  }

  network_interface {
    subnetwork = "${module.network_development.subnetwork_west}"

    access_config {
      nat_ip = "${google_compute_address.bastion_addy.address}"
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
