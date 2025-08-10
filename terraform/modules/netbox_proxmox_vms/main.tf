module "netbox_vms" {
  source = "../netbox_vms"

  count = length(var.vms)

  vm_name      = var.vms[count.index].name
  memory_mb    = var.vms[count.index].memory
  vcpus        = var.vms[count.index].cpu.cores
  disk_size_mb = var.vms[count.index].scsi_disk.size_mb

  extra_disks  = var.vms[count.index].scsi_extra_disks
  prefix       = var.prefix
  cluster_name = var.cluster_name
  netbox_url   = var.netbox_url
  netbox_token = var.netbox_token

}

module "proxmox_vms" {
  source = "../proxmox_vms"
  count  = length(var.vms)

  vm_user     = var.vm_user
  vm_ssh_keys = var.vm_ssh_keys

  vm_memory           = var.vms[count.index].memory
  vm_scsi_disk        = var.vms[count.index].scsi_disk
  vm_ip               = module.netbox_vms[count.index].ip_address
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
