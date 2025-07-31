resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  target_node = var.vm_target_node
  clone       = var.vm_clone
  full_clone  = true
  memory      = var.vm_memory
  agent       = 1
  os_type     = "cloud-init"

  cpu {
    cores   = var.vm_cpu.cores
    sockets = 1
    type    = "host"
  }

  boot             = "order=scsi0"
  scsihw           = "virtio-scsi-single"
  vm_state         = var.vm_state
  automatic_reboot = true

  ciupgrade  = true
  nameserver = "192.168.178.99 1.1.1.1 8.8.8.8"
  ipconfig0  = "ip=${var.vm_ip},gw=${var.vm_gateway}"
  skip_ipv6  = true

  sshkeys = var.vm_ssh_keys
  ciuser  = var.vm_user

  serial {
    id = 0
  }

  disk {
    slot    = "ide2"
    type    = "cloudinit"
    storage = var.vm_cloudinit.storage
  }

  disk {
    slot    = "scsi0"
    storage = var.vm_scsi_disk.storage
    size    = var.vm_scsi_disk.size
    format  = var.vm_scsi_disk.format
  }

  dynamic "disk" {
    for_each = var.vm_scsi_extra_disks
    content {
      slot    = disk.value.slot
      size    = disk.value.size
      format  = disk.value.format
      storage = disk.value.storage
    }
  }

  network {
    id     = 0
    bridge = "vmbr0"
    model  = "virtio"
  }
}
