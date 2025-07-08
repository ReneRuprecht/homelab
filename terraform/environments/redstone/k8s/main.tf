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
  nameserver = "1.1.1.1 8.8.8.8"
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
    storage = each.value.scsi_disks["scsi0"].storage
    size    = each.value.scsi_disks["scsi0"].size
    format  = each.value.scsi_disks["scsi0"].format
  }


  network {
    id     = 0
    bridge = "vmbr0"
    model  = "virtio"
  }
}
