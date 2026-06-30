vms = [
  {
    name     = "netbox-01.core.internal"
    vm_state = "running"
    ip       = "10.1.100.13/24"
    cpu = {
      cores = 2
    }
    target_node = "pve-01"
    memory      = 2048
    gateway     = "10.1.100.1"
    scsi_disk = {
      size    = "15G"
      size_mb = "15000"
    }
    tags = "core"
    vm_network = {
      bridge = "vmbr1"
      tag    = "100"
    }
  },
]
