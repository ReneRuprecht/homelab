terraform {
  backend "s3" {
    endpoints = {
      s3 = "http://backup-01.redstone:9000"
    }
    bucket                      = "terraform-state"
    key                         = "core/opnsense/terraform.tfstate"
    region                      = "main"
    use_path_style              = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
  }

  required_providers {
    dns = {
      source = "hashicorp/dns"
      version = "3.5.0"
    }
  }
}


provider "dns" {
  update {
    server        = var.dns_update_server
    key_name      = var.dns_update_key_name
    key_algorithm = var.dns_update_key_algorithm
    key_secret    = var.dns_update_key_secret
  }
}
