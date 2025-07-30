resource "proxmox_vm_qemu" "vm" {
  for_each = { for vm in var.vms : vm.name => vm }

  name        = each.value.name
  target_node = each.value.target_node
  clone       = each.value.clone
  full_clone  = true
  memory      = each.value.memory
  agent       = 1
  os_type     = "cloud-init"


  cpu {
    cores   = each.value.cpu.cores
    sockets = 1
    type    = "host"
  }

  boot             = "order=scsi0"
  scsihw           = "virtio-scsi-single"
  vm_state         = each.value.vm_state
  automatic_reboot = true

  ciupgrade  = true
  nameserver = "192.168.178.99 1.1.1.1 8.8.8.8"
  ipconfig0  = "ip=${each.value.ip}/24,gw=${each.value.gateway}"
  skip_ipv6  = true

  sshkeys = var.vm_ssh_keys
  ciuser  = var.vm_user

  serial {
    id = 0
  }

  disk {
    slot    = "ide2"
    type    = "cloudinit"
    storage = each.value.cloudinit.storage
  }
  disk {
    slot    = "scsi0"
    storage = each.value.scsi_disk.storage
    size    = each.value.scsi_disk.size
    format  = each.value.scsi_disk.format
  }

  dynamic "disk" {
      for_each = each.value.scsi_extra_disks
      content {
        slot = disk.value.slot
        size = disk.value.size
        format = disk.value.format
        storage = disk.value.storage
      }
    
  }

  


  network {
    id     = 0
    bridge = "vmbr0"
    model  = "virtio"
  }
}
