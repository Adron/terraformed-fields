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
    command = 
      "echo 'Installing Cassandra 3.11.3.' && echo 'deb http://www.apache.org/dist/cassandra/debian 311x main' | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list && curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -  && sudo apt-get update  && sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA  && sudo apt-get install cassandra"
  }
}
