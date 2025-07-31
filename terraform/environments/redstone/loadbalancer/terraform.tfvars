vms = [
  {
    vm_state = "running"
    name     = "loadbalancer-01.redstone"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.140"
    gateway = "192.168.178.1"
  },
]
