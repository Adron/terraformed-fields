module "network_development" {
  source = "modules/network/"

  network_name    = "dev-net"
  subnetwork_name = "dev-subnet"
}
