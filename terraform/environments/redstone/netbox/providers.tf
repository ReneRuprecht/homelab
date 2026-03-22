terraform {
  backend "s3" {
    endpoints = {
      s3 = "http://backup-01.redstone:9000"
    }
    bucket                      = "terraform-state"
    key                         = "redstone/netbox/terraform.tfstate"
    region                      = "main"
    use_path_style              = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
  }

  required_providers {
    # netbox = {
    #   source = "e-breuninger/netbox"
    #   version = "4.1.0"
    # }
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_debug        = true
}
