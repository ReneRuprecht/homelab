variable "vault_address" {
  description = "Vault ADDR"
  type        = string
}
variable "vault_token" {
  description = "Vault Token"
  type        = string
  sensitive   = true
}

variable "k8s_ca_cert" {
  description = "Kubernetes cluster CA certificate (Base64 encoded)"
  type        = string
  sensitive   = true
}
variable "k8s_host" {
  description = "Kubernetes host"
  type        = string
  sensitive   = true
}
