variable "ip_count" {
  type    = number
  default = 1
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

variable "vm_name" {
  description = "Name der virtuellen Maschine"
  type        = string
}

variable "memory_mb" {
  description = "Speichergröße in MB"
  type        = number
}

variable "vcpus" {
  description = "Anzahl vCPUs"
  type        = number
}

variable "disk_size_mb" {
  description = "Disk-Größe in MB"
  type        = number
}

variable "extra_disks" {
  description = "Liste zusätzlicher virtueller Disks"
  type = list(object({
    name        = string
    size_mb     = number
    description = optional(string, "")
  }))
  default = []
}

