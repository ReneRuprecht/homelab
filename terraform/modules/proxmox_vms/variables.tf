variable "vm_user" {
  description = "VM User"
  type        = string
}

variable "vm_ssh_keys" {
  description = "VM SSH Keys for login"
  type        = string
}

variable "vm_ip" {
  description = "VM IP"
  type        = string
}

variable "vm_name" {
  description = "VM Name"
  type        = string
}
variable "vm_target_node" {
  description = "VM Name"
  type        = string
  default     = "pve-02"
}
variable "vm_id" {
  description = "VM ID"
  type        = number
  default     = null
}

variable "vm_memory" {
  description = "VM Memory"
  type        = number
}

variable "vm_gateway" {
  description = "VM Gateway"
  type        = string
}

variable "vm_cpu" {
  description = "VM CPU"
  type = object({
    cores = number
  })
  default = {
    cores = 2
  }
}

variable "vm_state" {
  description = "VM State"
  type        = string
}

variable "vm_tags" {
  description = "VM tags"
  type        = string
  default     = null
}
variable "vm_clone" {
  description = "VM clone template"
  type        = string
  default     = "debian-12-cloud"
}

variable "vm_cloudinit" {
  description = "VM cloud init storage"
  type = object({
    storage = string
  })
  default = {
    storage = "internal-storage"
  }
}

variable "vm_scsi_disk" {
  description = "VM main disk"
  type = object({
    size    = optional(string, "20GB")
    storage = optional(string, "internal-storage")
    format  = optional(string, "raw")
  })
}

variable "vm_scsi_extra_disks" {
  description = "VM extra disks"
  type = list(
    object({
      size    = optional(string, "20GB")
      storage = optional(string, "internal-storage")
      format  = optional(string, "raw")
      slot    = string
    })
  )
  default = []

}


