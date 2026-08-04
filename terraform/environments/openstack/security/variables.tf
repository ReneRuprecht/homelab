
variable "os_auth_url" {
  description = "Auth Url"
  type        = string
  sensitive   = true

}

variable "os_username" {
  description = "Username"
  type        = string
  sensitive   = true
}

variable "os_password" {
  description = "Password"
  type        = string
  sensitive   = true
}

variable "os_project" {
  description = "Projekt"
  type        = string
}

variable "os_region" {
  description = "Region"
  type        = string
}

variable "os_ansible_ssh_key" {
  description = "Ansible SSH Key"
  type        = string
}
