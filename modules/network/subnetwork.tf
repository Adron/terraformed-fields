resource "google_compute_subnetwork" "subnetwork-name-east" {
  name          = "${var.subnetwork_name}-east1"
  region        = "us-east1"
  ip_cidr_range = "10.2.0.0/16"
  network       = "${google_compute_network.primary-network.self_link}"
}

resource "google_compute_subnetwork" "subnetwork-name-west" {
  name          = "${var.subnetwork_name}-west1"
  region        = "us-west1"
  ip_cidr_range = "10.1.0.0/16"
  network       = "${google_compute_network.primary-network.self_link}"
}