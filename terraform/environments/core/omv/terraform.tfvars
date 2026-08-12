vms = [
  {
    name        = "omv-01.core.internal"
    target_node = "pve-02"
    vm_state    = "started"
    memory      = 4096
    cpu         = { cores = 2 }
    ip          = "10.1.100.23/24"
    gateway     = "10.1.100.1"
    tags        = "core"
    vm_network = {
      bridge = "vmbr1"
      tag    = "100"
    }
  }
]
