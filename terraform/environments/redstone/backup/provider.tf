terraform {
  backend "consul" {
    path    = "terraform/state/redstone/backup"
  }

  required_providers {
    netbox = {
      source = "e-breuninger/netbox"
      version = "4.1.0"
    }
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_debug        = true
}
