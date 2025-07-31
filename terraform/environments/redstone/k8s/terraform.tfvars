vms = [
  {
    vm_state = "running"
    name     = "k8s-master-01.redstone"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.151"
    gateway = "192.168.178.1"
  },
  {
    vm_state = "running"
    name     = "k8s-node-01.redstone"
    cpu = {
      cores = 2
    }
    memory  = 8192
    ip      = "192.168.178.154"
    gateway = "192.168.178.1"
  },
  {
    vm_state = "running"
    name     = "k8s-node-02.redstone"
    cpu = {
      cores = 2
    }
    memory  = 8192
    ip      = "192.168.178.155"
    gateway = "192.168.178.1"
  }
]
