vms = [
  {
    name     = "vault-01.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    target_node = "pve-01"
    cluster_name = "Proxmox PVE-01"
    memory  = 2048
    gateway = "192.168.178.1"
  },
  {
    name     = "vault-02.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    gateway = "192.168.178.1"
  },
  {
    name     = "vault-03.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    gateway = "192.168.178.1"
  }
]
