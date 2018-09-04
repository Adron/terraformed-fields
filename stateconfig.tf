terraform {
  backend "gcs" {
    project = "thrashing-code"
    bucket  = "all-the-things-storage"
    prefix  = "terraform/state"
    credentials = "../infosec/account.json"
  }
}
