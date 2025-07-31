vms = [
  {
    name     = "k8s-master-01.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    gateway = "192.168.178.1"
  },
  {
    name     = "k8s-node-01.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 8192
    gateway = "192.168.178.1"
  },
  {
    name     = "k8s-node-02.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 8192
    gateway = "192.168.178.1"
  }
]
