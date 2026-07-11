vms = [
  {
    name     = "monitoring-01.core.internal"
    vm_state = "started"
    memory   = 2048
    cpu      = { cores = 2 }
    ip       = "10.1.100.19/24"
    gateway  = "10.1.100.1"
    cpu      = { cores = 2 }
    tags     = "core"
    vm_network = {
      bridge = "vmbr1"
      tag    = "100"
    }
  }
]
