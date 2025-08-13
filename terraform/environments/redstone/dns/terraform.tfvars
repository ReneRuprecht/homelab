vms = [
  {
    name     = "dns-01.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.95/24"
    gateway = "192.168.178.1"
  },
  {
    name     = "dns-02.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.96/24"
    gateway = "192.168.178.1"
  },
]
