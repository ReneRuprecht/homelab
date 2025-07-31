output "proxmox_vm_names" {
  description = "Map von VM-Namen zu Proxmox-VM-Namen"
  value = {
    for name, mod in module.proxmox_vms :
    name => mod.info
  }
}

