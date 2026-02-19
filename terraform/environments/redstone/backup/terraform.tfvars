vms = [
  {
    name     = "backup-01.redstone"
    vm_state = "started"
    memory   = 2048
    gateway  = "192.168.178.1"
    cpu      = { cores = 2 }
  },
  {
    name     = "backup-02.redstone"
    vm_state = "started"
    memory   = 2048
    target_node = "pve-02"
    cluster_name = "Proxmox PVE-02"
    gateway  = "192.168.178.1"
    cpu      = { cores = 2 }
  }
]
