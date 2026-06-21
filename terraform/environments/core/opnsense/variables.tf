variable "dns_update_server" {
  description = "Bind9 Server to update bind9"
  type        = string
  sensitive   = true
}

variable "dns_update_key_name" {
  description = "DNS Key Name"
  type        = string
  sensitive   = true
}

variable "dns_update_key_algorithm" {
  description = "DNS Key Algorithm"
  type        = string
  sensitive   = true
}

variable "dns_update_key_secret" {
  description = "DNS Key secret to update bind9"
  type        = string
  sensitive   = true
}


