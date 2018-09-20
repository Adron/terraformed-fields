// Networks
resource "google_compute_network" "dev-network" {
  name                    = "development-network-primary"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev-sub-east1" {
  name          = "development-subnet-east1"
  region        = "us-east1"
  ip_cidr_range = "10.2.0.0/16"
  network       = "${google_compute_network.dev-network.self_link}"
}

resource "google_compute_subnetwork" "dev-sub-west1" {
  name          = "development-subnet-west1"
  region        = "us-west1"
  ip_cidr_range = "10.1.0.0/16"
  network       = "${google_compute_network.dev-network.self_link}"
}

resource "google_compute_network" "prod-network" {
  name                    = "production-network-primary"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "prod-sub-east1" {
  name          = "production-subnet-east1"
  region        = "us-east1"
  ip_cidr_range = "10.3.0.0/16"
  network       = "${google_compute_network.prod-network.self_link}"
}

resource "google_compute_subnetwork" "prod-sub-west1" {
  name          = "production-subnet-west1"
  region        = "us-west1"
  ip_cidr_range = "10.4.0.0/16"
  network       = "${google_compute_network.prod-network.self_link}"
}

resource "google_compute_firewall" "bastion-ssh" {
  name    = "gimme-bastion-ssh"
  network = "${google_compute_network.dev-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "bastion-icmp" {
  name    = "gimme-bastion-icmp"
  network = "${google_compute_network.dev-network.name}"

  allow {
    protocol = "icmp"
  }
}

// Static IP's
resource "google_compute_address" "balancer" {
  name = "balancer"
}
