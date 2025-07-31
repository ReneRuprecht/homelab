module "netbox_vms" {
  for_each = { for vm in var.vms : vm.name => vm }

  source = "../netbox_vms"

  vm_name      = each.value.name
  memory_mb    = each.value.memory
  vcpus        = each.value.cpu.cores
  disk_size_mb = each.value.scsi_disk.size_mb

  extra_disks = each.value.scsi_extra_disks


  prefix       = var.prefix
  cluster_name = var.cluster_name
  netbox_url   = var.netbox_url
  netbox_token = var.netbox_token
}

module "proxmox_vms" {
  for_each = { for vm in var.vms : vm.name => vm }

  source      = "../proxmox_vms"
  vm_user     = var.vm_user
  vm_ssh_keys = var.vm_ssh_keys

  vm_memory           = each.value.memory
  vm_scsi_disk        = each.value.scsi_disk
  vm_ip               = module.netbox_vms[each.value.name].ip_address
  vm_name             = each.value.name
  vm_state            = each.value.vm_state
  vm_gateway          = each.value.gateway
  vm_scsi_extra_disks = each.value.scsi_extra_disks

  vm_id          = each.value.vmid
  vm_cpu         = each.value.cpu
  vm_clone       = each.value.clone
  vm_tags        = each.value.tags
  vm_target_node = each.value.target_node

}
