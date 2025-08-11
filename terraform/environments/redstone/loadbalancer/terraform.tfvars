vms = [
  {
    name     = "loadbalancer-01.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    tags = "test"
    gateway = "192.168.178.1"
  },
  {
    name     = "loadbalancer-02.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    gateway = "192.168.178.1"
  },
]
