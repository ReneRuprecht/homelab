vms = [
  {
    name     = "k8s-master-01.redstone"
    vm_state = "running"
    target_node = "pve-01"
    cpu = {
      cores = 2
    }
    memory  = 8192
    gateway = "192.168.178.1"
  },
  {
    name     = "k8s-node-01.redstone"
    vm_state = "running"
    target_node = "pve-02"
    cpu = {
      cores = 2
    }
    memory  = 8192
    gateway = "192.168.178.1"
    scsi_extra_disks = [
      { name = "scsi1", size_mb = 100000, size = "100G", slot = "scsi1" }
    ]
  },
  {
    name     = "k8s-node-02.redstone"
    vm_state = "running"
    target_node = "pve-02"
    cpu = {
      cores = 2
    }
    memory  = 8192
    gateway = "192.168.178.1"
    scsi_extra_disks = [
      { name = "scsi1", size_mb = 100000, size = "100G", slot = "scsi1" }
    ]
  }
]
