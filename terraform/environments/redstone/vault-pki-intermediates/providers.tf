terraform {
  backend "s3" {
    endpoints = {
      s3 = "http://backup-01.redstone:9000"
    }
    bucket                      = "terraform-state"
    key                         = "redstone/vault-pki-intermediates/terraform.tfstate"
    region                      = "main"
    use_path_style              = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
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
