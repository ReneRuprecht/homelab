terraform {
  backend "consul" {
    path    = "terraform/state/redstone/monitoring"
  }

  required_providers {
    netbox = {
      source = "e-breuninger/netbox"
      version = "4.1.0"
    }
    proxmox = {
      source = "telmate/proxmox"
    }
    dns = {
      source = "hashicorp/dns"
      version = "3.5.0"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_debug        = true
}

provider "dns" {
  update {
    server        = var.dns_update_server
    key_name      = var.dns_update_key_name
    key_algorithm = var.dns_update_key_algorithm
    key_secret    = var.dns_update_key_secret
  }
}
