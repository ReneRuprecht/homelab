vms = [
  {
    name     = "netbox-01.redstone"
    vm_state = "running"
    ip = "192.168.178.91/24"
    cpu = {
      cores = 2
    }
    target_node = "pve-01"
    memory  = 2048
    gateway = "192.168.178.1"
    scsi_disk = {
      size = "15G"
      size_mb = "15000"
    }
  },
]
