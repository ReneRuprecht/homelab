vms = [
  {
    name     = "consul-01.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.92/24"
    gateway = "192.168.178.1"
  },
  {
    name     = "consul-02.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.93/24"
    gateway = "192.168.178.1"
  },
  {
    name     = "consul-03.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.94/24"
    gateway = "192.168.178.1"
  }
]
