module "network_development" {
  source = "modules/network/"

  network_name = "dev-net"
  subnetwork_name = "dev-subnet"
}

module "node_one" {
  source = "modules/cassandra/"

  node_name = "node-one"
  address_name = "node-one-address"
  subnetwork = "${module.network_development.subnetwork_west}"
  address_ip = "10.1.0.5"
  node_zone = "us-west1-a"
}

module "node_two" {
  source = "modules/cassandra/"

  node_name = "node-two"
  address_name = "node-two-address"
  subnetwork = "${module.network_development.subnetwork_west}"
  address_ip = "10.1.0.4"
  node_zone = "us-west1-a"
}

module "node_three" {
  source = "modules/cassandra/"

  node_name = "node-three"
  address_name = "node-three-address"
  subnetwork = "${module.network_development.subnetwork_west}"
  address_ip = "10.1.0.3"
  node_zone = "us-west1-a"
}
