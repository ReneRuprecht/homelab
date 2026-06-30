vms = [
  {
    name     = "gh-runner-02.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    tags = "redstone"
    scsi_disk = {
      size    = "40G",
      size_mb = 40000
    }
    target_node  = "pve-02"
    cluster_name = "Proxmox PVE-02"
    memory       = 8192
    gateway      = "10.2.100.1"
    vm_network = {
      tag    = 200
      bridge = "vmbr1"
    }
  }
]
