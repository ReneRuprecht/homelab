vms = [
  {
    name     = "registry-01.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    gateway = "192.168.178.1"
    scsi_extra_disks = [{
      name    = "scsi1"
      slot    = "scsi1"
      size    = "30G"
      size_mb = "30000"
    }]
  },
]
