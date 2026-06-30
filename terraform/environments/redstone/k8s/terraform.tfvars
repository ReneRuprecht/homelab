vms = [
  {
    name        = "k8s-master-01.redstone"
    vm_state    = "running"
    target_node = "pve-01"
    cpu = {
      cores = 2
    }
    memory  = 8192
    gateway = "10.2.100.1"
    tags    = "redstone"
    vm_network = {
      tag    = "200"
      bridge = "vmbr1"
    }
  },
  {
    name        = "k8s-node-01.redstone"
    vm_state    = "running"
    target_node = "pve-02"
    cpu = {
      cores = 2
    }
    memory  = 10240
    gateway = "10.2.100.1"
    tags    = "redstone"
    vm_network = {
      tag    = "200"
      bridge = "vmbr1"
    }
    scsi_disk = {
      size    = "25G",
      size_mb = 25000
    }
    scsi_extra_disks = [
      { name = "scsi1", size_mb = 100000, size = "100G", slot = "scsi1" }
    ]
  },
  {
    name        = "k8s-node-02.redstone"
    vm_state    = "running"
    target_node = "pve-02"
    cpu = {
      cores = 2
    }
    memory  = 10240
    gateway = "10.2.100.1"
    tags    = "redstone"
    vm_network = {
      tag    = "200"
      bridge = "vmbr1"
    }
    scsi_disk = {
      size    = "25G",
      size_mb = 25000
    }
    scsi_extra_disks = [
      { name = "scsi1", size_mb = 100000, size = "100G", slot = "scsi1" }
    ]
  }
]
