resource "google_compute_firewall" "development-default-http" {
  name = "development-default-http"
  network = "${google_compute_network.development.name}"

  allow {
    protocol = "tcp"
    ports = [
      "80"]
  }

  source_ranges = [
    "0.0.0.0/0"]
  target_tags = [
    "dev-http"]
}

# Currently not used.
resource "google_compute_firewall" "development-default-https" {
  name = "development-default-https"
  network = "${google_compute_network.development.name}"

  allow {
    protocol = "tcp"
    ports = [
      "443"]
  }

  source_ranges = [
    "0.0.0.0/0"]
  target_tags = [
    "dev-https"]
}

resource "google_compute_firewall" "development-default-nodejs" {
  name = "development-default-nodejs"
  network = "${google_compute_network.development.name}"

  allow {
    protocol = "tcp"
    ports = [
      "3000"]
  }

  source_ranges = [
    "0.0.0.0/0"]
  target_tags = [
    "dev-nodejs"]
}

resource "google_compute_firewall" "development-default-allow-icmp" {
  name = "development-default-allow-internal"
  network = "${google_compute_network.development.name}"

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "0.0.0.0/0"]
}

resource "google_compute_firewall" "development-default-ssh" {
  name = "development-default-ssh"
  network = "${google_compute_network.development.name}"

  allow {
    protocol = "tcp"
    ports = [
      "22"]
  }

  source_ranges = [
    "0.0.0.0/0"]
}

resource "google_compute_firewall" "development-default-internal" {
  name = "development-default-internal"
  network = "${google_compute_network.development.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = [
      "0-65535"]
  }

  allow {
    protocol = "udp"
    ports = [
      "0-65535"]
  }

  source_ranges = [
    "10.128.0.0/9"]
}
