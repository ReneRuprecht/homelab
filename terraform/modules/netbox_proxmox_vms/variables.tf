variable "vm_user" {
  description = "VM User"
  type        = string
}

variable "vm_ssh_keys" {
  description = "VM SSH Keys for login"
  type        = string
}

variable "vm_ips" {
  description = "Map von VM-Namen auf zugewiesene IP-Adressen"
  type        = map(string)
  default     = {}
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
      storage = string
      format  = string
      slot    = string
    })), [])
  }))
}

variable "vm_ip" {
  description = "Map von VM-Namen auf zugewiesene IP-Adressen"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "CIDR Prefix aus NetBox, z. B. '192.168.178.0/24'"
  type        = string
  default     = "192.168.178.0/24"
}

variable "cluster_name" {
  description = "Name des Clusters in NetBox"
  type        = string
  default     = "Proxmox PVE-02"
}
