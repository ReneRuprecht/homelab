vms = [
  {
    name     = "elastic-01.core.internal"
    vm_state = "started"
    memory   = 8192
    cpu      = { cores = 2 }
    ip       = "10.1.100.20/24"
    gateway  = "10.1.100.1"
    cpu      = { cores = 2 }
    tags     = "core"
    vm_network = {
      bridge = "vmbr1"
      tag    = "100"
    }
  }
]
