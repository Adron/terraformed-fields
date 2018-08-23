// Networks

resource "google_compute_network" "dev-network" {
  name = "development-network-primary"
}

resource "google_compute_network" "prod-network" {
  name = "production-network-primary"
}