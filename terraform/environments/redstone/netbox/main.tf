module "proxmox_vms" {
  source = "../../../modules/proxmox_vms"

  count  = length(var.vms)

  vm_user     = var.vm_user
  vm_ssh_keys = var.vm_ssh_keys

  vm_memory           = var.vms[count.index].memory
  vm_scsi_disk        = var.vms[count.index].scsi_disk
  vm_ip               = var.vms[count.index].ip
  vm_name             = var.vms[count.index].name
  vm_state            = var.vms[count.index].vm_state
  vm_gateway          = var.vms[count.index].gateway
  vm_scsi_extra_disks = var.vms[count.index].scsi_extra_disks

  vm_id          = var.vms[count.index].vmid
  vm_cpu         = var.vms[count.index].cpu
  vm_clone       = var.vms[count.index].clone
  vm_tags        = var.vms[count.index].tags
  vm_target_node = var.vms[count.index].target_node

}

