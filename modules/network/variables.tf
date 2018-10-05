variable "network_name" {
    type = "string"
    description = "The name of the network to create. Examples would include 'dev-network'."
}
variable "subnetwork_name" {
    type = "string"
    description = "The name of the subnetwork to create within the network. Examples would include 'dev-subnetwork-east1'."
}
output "subnetwork_east" {
    description = "The returned subnetwork self link to reference which subnetwork to place an instance being created into."
    value = "${google_compute_subnetwork.subnetwork-name-east.self_link}"
}
output "subnetwork_west" {
    description = "The returned subnetwork self link to reference which subnetwork to place an instance being created into."
    value = "${google_compute_subnetwork.subnetwork-name-west.self_link}"
}