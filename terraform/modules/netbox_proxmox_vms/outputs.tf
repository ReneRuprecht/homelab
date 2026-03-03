output "proxmox_vms" {
  description = "Map von VM-Namen zu Proxmox-VM-Namen"
  value = {
    for i in range(length(module.proxmox_vms)) :
    module.proxmox_vms[i].info.name => split("/", module.proxmox_vms[i].info.ip)[0]
  }
}

