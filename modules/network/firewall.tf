resource "google_compute_firewall" "bastion-ssh" {
  name    = "gimme-bastion-ssh"
  network = "${google_compute_network.primary-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "bastion-icmp" {
  name    = "gimme-bastion-icmp"
  network = "${google_compute_network.primary-network.name}"

  allow {
    protocol = "icmp"
  }
}
