vms = [
  {
    vm_state    = "running"
    name        = "nfs-01.redstone"
    target_node = "pve-02"
    clone       = "debian-12-cloud"
    cpu = {
      cores = 2
    }
    memory  = 2048
    ip      = "192.168.178.143"
    gateway = "192.168.178.1"
    scsi_extra_disks = [ {
      slot = "scsi1"
      size = "30G"
    } ]
  },
]
