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
    gateway      = "192.168.178.1"
    vm_network_extra = [ {
      id = 1
      tag = 200
      bridge = "vmbr1"
    } ]
  }
]
