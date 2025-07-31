vms = [
  {
    vm_state = "running"
    name     = "netbox-01.redstone"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.111"
    gateway = "192.168.178.1"
    scsi_disk = {
      size = "30G"
    }
  },
]
