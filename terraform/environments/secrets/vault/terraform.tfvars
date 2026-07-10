vms = [
  {
    name     = "vault-01.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    target_node        = "pve-01"
    memory             = 2048
    ip                 = "10.1.115.11/24"
    gateway            = "10.1.115.1"
    start_at_node_boot = false
    tags               = "secrets"
    vm_network = {
      bridge = "vmbr1"
      tag    = "115"
    }
  },
  {
    name     = "vault-02.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory             = 2048
    ip                 = "10.1.115.12/24"
    gateway            = "10.1.115.1"
    start_at_node_boot = false
    tags               = "secrets"
    vm_network = {
      bridge = "vmbr1"
      tag    = "115"
    }
  },
  {
    name     = "vault-03.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory             = 2048
    ip                 = "10.1.115.13/24"
    gateway            = "10.1.115.1"
    start_at_node_boot = false
    tags               = "secrets"
    vm_network = {
      bridge = "vmbr1"
      tag    = "115"
    }
  }
]
