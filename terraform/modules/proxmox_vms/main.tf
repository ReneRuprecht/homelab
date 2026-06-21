resource "proxmox_vm_qemu" "vm" {
  name               = var.vm_name
  target_node        = var.vm_target_node
  clone              = var.vm_clone
  full_clone         = true
  memory             = var.vm_memory
  agent              = 1
  os_type            = "cloud-init"
  start_at_node_boot = var.vm_start_at_node_boot

  startup_shutdown {
    order            = -1
    shutdown_timeout = -1
    startup_delay    = -1
  }

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
  nameserver = var.vm_nameserver
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
    id     = var.vm_network.id
    bridge = var.vm_network.bridge
    model  = var.vm_network.model
    tag    = var.vm_network.tag
  }

  dynamic "network" {
    for_each = var.vm_network_extra
    content {
      id     = network.value.id
      bridge = network.value.bridge
      model  = network.value.model
      tag    = network.value.tag
    }
  }

}
