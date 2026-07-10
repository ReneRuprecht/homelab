vms = [
  {
    name     = "keycloak-01.identity.internal"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    target_node        = "pve-01"
    memory             = 2048
    ip                 = "10.1.110.11/24"
    gateway            = "10.1.110.1"
    start_at_node_boot = false
    tags               = "identity"
    vm_network = {
      bridge = "vmbr1"
      tag    = "110"
    }
  },
]
