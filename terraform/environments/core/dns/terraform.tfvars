vms = [
  {
    name     = "dns-01.core.internal"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory             = 2048
    ip                 = "10.1.100.11/24"
    gateway            = "10.1.100.1"
    start_at_node_boot = true
    vm_network_extra = [{
      id     = 1
      bridge = "vmbr1"
      tag    = "100"
    }]
  },
  {
    name        = "dns-02.core.internal"
    vm_state    = "running"
    target_node = "pve-02"
    cpu = {
      cores = 2
    }
    memory             = 2048
    ip                 = "10.1.100.12/24"
    gateway            = "10.1.100.1"
    start_at_node_boot = true
    vm_network_extra = [{
      id     = 1
      bridge = "vmbr1"
      tag    = "100"
    }]
  },
]
