terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc04"
    }
    netbox = {
      source  = "e-breuninger/netbox"
      version = "4.1.0"
    }
  }
}
