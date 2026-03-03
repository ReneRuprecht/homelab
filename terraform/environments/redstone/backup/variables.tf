variable "dns_update_server" {
  description = "Bind9 Server to update bind9"
  type        = string
  sensitive   = true
}

variable "dns_update_key_name" {
  description = "DNS Key Name"
  type        = string
  sensitive   = true
}

variable "dns_update_key_algorithm" {
  description = "DNS Key Algorithm"
  type        = string
  sensitive   = true
}

variable "dns_update_key_secret" {
  description = "DNS Key secret to update bind9"
  type        = string
  sensitive   = true
}

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
    target_node = optional(string, "pve-01")
    vmid        = optional(number)
    memory      = number
    ip          = optional(string, "")
    gateway     = string
    cpu = object({
      cores = optional(number, 1)
    })
    vm_state = string
    tags     = optional(string)
    clone    = optional(string, "debian-13-cloud")

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
      size    = "15G"
      size_mb = "15000"
    })

    scsi_extra_disks = optional(list(object({
      name    = string
      size    = string
      size_mb = number
      storage = optional(string, "internal-storage")
      format  = optional(string, "raw")
      slot    = string
    })), [])

    cluster_name = optional(string, "Proxmox PVE-01")
    prefix       = optional(string, "192.168.178.0/24")
  }))
}
