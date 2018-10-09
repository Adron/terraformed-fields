variable "node_name" {
  type        = "string"
  description = "The name of the node instance to create."
}

variable "address_name" {
  type        = "string"
  description = "The name of the address resource to create."
}

variable "address_ip" {
  type        = "string"
  description = "The internal reserved IP address of the instance being created."
}

variable "subnetwork" {
  type        = "string"
  description = "The subnetwork to create the instance in."
}

variable "node_zone" {
  type        = "string"
  description = "The zone where the instance will be created."
}
