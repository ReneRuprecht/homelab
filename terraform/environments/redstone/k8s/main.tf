module "proxmox_vms" {
  source = "../../../modules/proxmox_vms"

  vms         = var.vms
  vm_user     = var.vm_user
  vm_ssh_keys = var.vm_ssh_keys
}
