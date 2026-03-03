vms = [
  {
    name     = "gh-runner-01.redstone"
    vm_state = "running"
    cpu = {
      cores = 2
    }
    scsi_disk = {
      size = "20G",
      size_mb = 20000
    }
    memory  = 4096
    gateway = "192.168.178.1"
  },
  {
    name     = "gh-runner-02.redstone"
    vm_state = "stopped"
    cpu = {
      cores = 2
    }
    target_node = "pve-02"
    cluster_name = "Proxmox PVE-02"
    memory  = 2048
    gateway = "192.168.178.1"
  }
]
