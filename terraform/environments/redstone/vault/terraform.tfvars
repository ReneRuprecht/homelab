vms = [
  {
    vm_state    = "running"
    name        = "vault-01.redstone"
    target_node = "pve-02"
    clone       = "debian-12-cloud"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.148"
    gateway = "192.168.178.1"
  },
  {
    vm_state    = "running"
    name        = "vault-02.redstone"
    target_node = "pve-02"
    clone       = "debian-12-cloud"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.149"
    gateway = "192.168.178.1"
  },
  {
    vm_state    = "running"
    name        = "vault-03.redstone"
    target_node = "pve-02"
    clone       = "debian-12-cloud"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.150"
    gateway = "192.168.178.1"
  }
]
