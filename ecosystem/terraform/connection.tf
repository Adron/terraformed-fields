# Configure the Google Cloud provider

# If you're curious about the accountjson & how it's working currently,
# ping me @adron on Twitter and happy to discuss.

provider "google" {
  credentials = "${file("../../../secrets/account.json")}"
  project = "that-big-universe"
  region = "us-west1"
}

provider "aws" {
  region = "us-west-2"
}
