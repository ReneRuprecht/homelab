vms = [
  {
    vm_state = "running"
    name     = "vault-01.redstone"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.148"
    gateway = "192.168.178.1"
  },
  {
    vm_state = "running"
    name     = "vault-02.redstone"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.149"
    gateway = "192.168.178.1"
  },
  {
    vm_state = "running"
    name     = "vault-03.redstone"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.150"
    gateway = "192.168.178.1"
  }
]
