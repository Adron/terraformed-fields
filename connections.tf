provider "google" {
  credentials = "${file("../infosec/account.json")}"
  project     = "thrashing-code"
  region      = "us-west1"
}

provider "aws" {

}

provider "azure" {

}

