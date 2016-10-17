# Elasticsearch One
resource "google_compute_instance" "sample-brood-1" {
  name = "sample-nodejs-1"
  machine_type = "f1-micro"
  tags = [
    "http-server",
    "https-server",
    "dev-http",
    "dev-https",
    "dev-nodejs",
    "dev-ssh"]

  zone = "us-west1-a"

  disk {
    image = "${var.image}"
    size = 20
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.dev-space-us-west1.name}"
    access_config {
    }
  }

  provisioner "local-exec" {
    command = "./package-app.sh"
  }

  provisioner "file" {
    source = "nodejs_application.tar.gz"
    destination = "nodejs_application.tar.gz"
    connection {
      user = "adron"
      private_key = "${file("/Users/adron/.ssh/google_compute_engine")}"
      agent = "false"
      timeout = "1m"
    }
  }

  provisioner "file" {
    source = "setup-app.sh"
    destination = "setup-app.sh"
    connection {
      user = "adron"
      private_key = "${file("/Users/adron/.ssh/google_compute_engine")}"
      agent = "false"
      timeout = "1m"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 700 setup-app.sh",
      "./setup-app.sh ${google_compute_instance.sample-brood-1.network_interface.0.access_config.0.assigned_nat_ip}"]

    connection {
      user = "adron"
      private_key = "${file("/Users/adron/.ssh/google_compute_engine")}"
      agent = "false"
      timeout = "1m"
    }
  }

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro"]
  }
}
