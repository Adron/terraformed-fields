variable ssh_key_path {
  default = "~/.ssh/id_rsa"
}

variable build_bastion {
  default = true
  description = "The variable for determining to build the Bastion server or not."
}
