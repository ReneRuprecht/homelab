terraform {
  backend "consul" {
    path    = "terraform/state/redstone/vault-k8s-auth"
  }

  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "5.7.0"
    }
  }
}

provider "vault" {
    address = var.vault_address
    token = var.vault_token
}
