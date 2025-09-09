variable "vm_user" {
  description = "VM User"
  type        = string
}

variable "vm_ssh_keys" {
  description = "VM SSH Keys for login"
  type        = string
}

variable "vms" {
  description = "Liste von VMs mit Parametern für Proxmox + NetBox"
  type = list(object({
    name        = string
    target_node = optional(string, "pve-02")
    vmid        = optional(number)
    memory      = number
    ip          = optional(string, "")
    gateway     = string
    cpu = object({
      cores = optional(number, 1)
    })
    vm_state = string
    tags     = optional(string)
    clone    = optional(string, "debian-12-cloud")

    cloudinit = optional(object({
      storage = optional(string, "internal-storage")
      }), {
      storage = "internal-storage"
    })

    scsi_disk = optional(object({
      size    = string
      size_mb = number
      storage = optional(string, "internal-storage")
      format  = optional(string, "raw")
      }), {
      size    = "20G"
      size_mb = "20000"
    })

    scsi_extra_disks = optional(list(object({
      name    = string
      size    = string
      size_mb = number
      storage = optional(string, "internal-storage")
      format  = optional(string, "raw")
      slot    = string
    })), [])
  }))
}
