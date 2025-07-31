vms = [
  {
    vm_state = "running"
    name     = "registry-01.redstone"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.110"
    gateway = "192.168.178.1"
    scsi_extra_disks = [{
      slot = "scsi1"
      size = "30G"
    }]
  },
]
