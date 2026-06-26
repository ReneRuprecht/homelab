vms = [
  {
    name     = "backup-01.redstone"
    vm_state = "started"
    memory   = 2048
    gateway  = "192.168.178.1"
    cpu      = { cores = 2 }
    vm_network_extra = [{
      id     = 1
      bridge = "vmbr1"
      tag    = "100"
    }]
  },
  {
    name         = "backup-02.redstone"
    vm_state     = "started"
    memory       = 2048
    target_node  = "pve-02"
    cluster_name = "Proxmox PVE-02"
    gateway      = "192.168.178.1"
    cpu          = { cores = 2 }
    vm_network_extra = [{
      id     = 1
      bridge = "vmbr1"
      tag    = "100"
    }]
  }
]
