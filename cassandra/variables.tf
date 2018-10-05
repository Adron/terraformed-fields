variable "node_ip" {
  type        = "string"
  description = "The internal IP address of a particular node."
}

variable "node_address_name" {
  type = "string"
  description = "The name of the IP address setup for the node."
}

variable "node_name" {
  type = "string"
  description = "The name of the specific node to create."
}

variable "node_subnetwork" {
    type = "string"
    description = "The subnetwork."
}

