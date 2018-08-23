// Networks

resource "google_compute_network" "dev-network" {
  name = "development-network-primary"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev-sub-east1" {
  name = "development-subnet-east1"
  region = "us-east1"
  ip_cidr_range = "10.2.0.0/16"
  network = "${google_compute_network.dev-network.self_link}"
}

resource "google_compute_subnetwork" "dev-sub-west1" {
  name = "development-subnet-west1"
  region = "us-west1"
  ip_cidr_range = "10.1.0.0/16"
  network = "${google_compute_network.dev-network.self_link}"
}

resource "google_compute_network" "prod-network" {
  name = "production-network-primary"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "prod-sub-east1" {
  name = "production-subnet-east1"
  region = "us-east1"
  ip_cidr_range = "10.3.0.0/16"
  network = "${google_compute_network.prod-network.self_link}"
}

resource "google_compute_subnetwork" "prod-sub-west1" {
  name = "production-subnet-west1"
  region = "us-west1"
  ip_cidr_range = "10.4.0.0/16"
  network = "${google_compute_network.prod-network.self_link}"
}

// Server Instances
resource "google_compute_instance" "default" {
  name = "test"
  machine_type = "n1-standard-1"
  zone = "us-west1-a"

  tags = [
    "foo",
    "bar"]

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-bionic-v20180814"
    }
  }

  scratch_disk {
  }

  network_interface {
    network = "${google_compute_subnetwork.dev-sub-east1}"
    access_config {}
  }

  metadata {
    node = "cassandra"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro"]
  }
}