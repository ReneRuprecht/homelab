vms = [
  {
    name     = "gh-runner-01.core.internal"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    ip      = "10.1.100.16/24"
    gateway = "10.1.100.1"
    tags    = "core"
    scsi_disk = {
      size    = "30G",
      size_mb = 30000
    }
    memory = 8192
    vm_network = {
      bridge = "vmbr1"
      tag    = "100"
    }
  },
]
