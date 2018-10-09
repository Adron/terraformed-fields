resource "google_compute_address" "node_zero_address" {
  name         = "${var.address_name}"
  subnetwork   = "${var.subnetwork}"
  address_type = "INTERNAL"
  address      = "${var.address_ip}"
}
