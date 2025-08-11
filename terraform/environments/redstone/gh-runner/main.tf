module "netbox_proxmox_vms" {
  source = "../../../modules/netbox_proxmox_vms"

  vm_user      = var.vm_user
  vm_ssh_keys  = var.vm_ssh_keys

  prefix       = "192.168.178.0/24"
  cluster_name = "Proxmox PVE-02"
  vms          = var.vms
}

