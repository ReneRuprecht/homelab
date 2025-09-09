module "netbox_proxmox_vms" {
  source = "../../../modules/netbox_proxmox_vms"

  vm_user      = var.vm_user
  vm_ssh_keys  = var.vm_ssh_keys
  vms          = var.vms
}

