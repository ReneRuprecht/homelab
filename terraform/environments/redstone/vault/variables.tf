variable "vm_user" {
  type = string
}

variable "vm_ssh_keys" {
  type = string
}

variable "vms" {
  type = list(object({
    name        = string
    target_node = optional(string)
    vmid        = optional(number)
    memory      = number
    ip          = string
    gateway     = string
    cpu = object({
      cores = optional(number, 1)
    })
    vm_state = string
    tags     = optional(string)
    clone    = string
    scsi_disks = optional(map(object({
      size    = optional(string, "20GB")
      storage = optional(string, "internal-storage")
      format  = optional(string, "raw")
      })),
      {
        scsi0 = { format = "raw", size = "20G", storage = "internal-storage" }
      }
    )
    cloudinit = optional(object({
      storage = optional(string, "internal-storage")
      }),
      {
        storage = "internal-storage"
      }
    )
  }))
}
