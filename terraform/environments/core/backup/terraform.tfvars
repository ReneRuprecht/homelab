vms = [
  {
    name     = "backup-01.core.internal"
    vm_state = "started"
    memory   = 2048
    ip       = "10.1.100.14/24"
    gateway  = "10.1.100.1"
    cpu      = { cores = 2 }
    tags     = "core"
    vm_network = {
      bridge = "vmbr1"
      tag    = "100"
    }
  },
  {
    name         = "backup-02.redstone"
    vm_state     = "started"
    memory       = 2048
    target_node  = "pve-02"
    cluster_name = "Proxmox PVE-02"
    ip           = "10.1.100.15/24"
    gateway      = "10.1.100.1"
    cpu          = { cores = 2 }
    tags         = "core"
    vm_network = {
      bridge = "vmbr1"
      tag    = "100"
    }
  }
]
