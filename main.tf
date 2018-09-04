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
variable "instance_names" {
  type = "map"
  default = {
    "0" = "frank"
    "1" = "sally"
  }
}

resource "google_compute_instance" "default" {
  count = "2"
  name = "${lookup(var.instance_names, count.index)}"
  machine_type = "n1-standard-1"
  zone = "us-west1-a"

  tags = [
    "${lookup(var.instance_names, count.index)}"]

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-bionic-v20180814"
    }
  }

  scratch_disk {
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.dev-sub-west1.id}"
    access_config {}
  }

  metadata {
    node = "cassandra"
    named = "${lookup(var.instance_names, count.index)}"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro"]
  }
}

resource "google_container_cluster" "primary" {
  name               = "marcellus-wallace"
  zone               = "us-west1-a"
  initial_node_count = 3

//  additional_zones = [
//    "us-west1-b",
//    "us-west1-c",
//  ]

  master_auth {
    username = "boss"
    password = "the*long*enough*password"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }
}

# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}
