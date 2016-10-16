resource "google_compute_http_health_check" "samle-nodejs-health-check" {
  name = "sample-nodejs-health-check"
  request_path = "/"
  check_interval_sec = 1
  timeout_sec = 1
}