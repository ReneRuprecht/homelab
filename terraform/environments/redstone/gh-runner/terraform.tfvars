vms = [
  {
    name     = "gh-runner-01.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    scsi_disk = {
      size    = "30G",
      size_mb = 30000
    }
    memory  = 8192
    gateway = "192.168.178.1"
    vm_network_extra = [{
      id     = 1
      bridge = "vmbr1"
      tag    = "100"
    }]
  },
  {
    name     = "gh-runner-02.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    scsi_disk = {
      size    = "40G",
      size_mb = 40000
    }
    target_node  = "pve-02"
    cluster_name = "Proxmox PVE-02"
    memory       = 8192
    gateway      = "192.168.178.1"
  }
]
