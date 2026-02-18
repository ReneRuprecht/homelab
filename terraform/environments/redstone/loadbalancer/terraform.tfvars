vms = [
  {
    name     = "loadbalancer-01.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    memory  = 2048
    gateway = "192.168.178.1"
  },
  {
    name     = "loadbalancer-02.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    target_node = "pve-02"
    cluster_name = "Proxmox PVE-02"
    memory  = 2048
    gateway = "192.168.178.1"
  },
]
