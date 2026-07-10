vms = [
  {
    name     = "loadbalancer-01.core.internal"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "10.1.100.17/24"
    gateway = "10.1.100.1"
    tags    = "core"
    vm_network = {
      bridge = "vmbr1"
      tag    = "100"
    }
    start_at_node_boot = true
  },
  {
    name     = "loadbalancer-02.core.internal"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "10.1.100.18/24"
    gateway = "10.1.100.1"
    tags    = "core"
    vm_network = {
      bridge = "vmbr1"
      tag    = "100"
    }
    target_node = "pve-02"
  },
]

