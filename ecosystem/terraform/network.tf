resource "google_compute_network" "development" {
  name = "development"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev-space-us-west1" {
  name = "dev-space"
  ip_cidr_range = "10.128.0.0/20"
  network = "${google_compute_network.development.self_link}"
  region = "us-west1"
}
