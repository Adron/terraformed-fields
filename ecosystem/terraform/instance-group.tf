resource "google_compute_instance_group" "nodejs-instance-group" {
  name = "nodejs-instance-group"
  description = "Sample Nodejs Server & Application following Autopilot Patter + 12-factor."

  instances = [
    "${google_compute_instance.sample-nodejs-1.self_link}",
    "${google_compute_instance.sample-nodejs-2.self_link}"
  ]

  named_port {
    name = "http"
    port = "80"
  }

  named_port {
    name = "https"
    port = "443"
  }

  zone = "us-west1-a"
}
