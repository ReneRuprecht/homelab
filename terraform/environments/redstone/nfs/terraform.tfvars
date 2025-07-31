vms = [
  {
    name     = "nfs-01.redstone"
    vm_state = "started"
    memory   = 2048
    gateway  = "192.168.178.1"
    cpu      = { cores = 2 }
    scsi_extra_disks = [
      { name = "scsi1", size_mb = 30000, size = "30G", slot = "scsi1" }
    ]
  }
]
