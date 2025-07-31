data "netbox_prefix" "prefix" {
  prefix = var.prefix
}

data "netbox_cluster" "cluster" {
  name = var.cluster_name
}

resource "netbox_virtual_machine" "vm" {
  cluster_id = data.netbox_cluster.cluster.id
  name       = var.vm_name
  memory_mb  = var.memory_mb
  vcpus      = var.vcpus
}


resource "netbox_interface" "eth0" {
  name               = "eth0"
  virtual_machine_id = netbox_virtual_machine.vm.id
}

resource "netbox_available_ip_address" "ip" {
  prefix_id    = data.netbox_prefix.prefix.id
  interface_id = netbox_interface.eth0.id
  status       = "active"
  object_type  = "virtualization.vminterface"
}

resource "netbox_virtual_disk" "extra_disks" {
  for_each = {
    for disk in var.extra_disks :
    disk.name => disk
  }

  name               = each.value.name
  description        = try(each.value.description, "")
  size_mb            = each.value.size_mb
  virtual_machine_id = netbox_virtual_machine.vm.id
}

resource "netbox_virtual_disk" "main_disk" {
  name               = "scsi0"
  description        = "Main disk"
  size_mb            = var.disk_size_mb
  virtual_machine_id = netbox_virtual_machine.vm.id
}

resource "netbox_primary_ip" "primary" {
  ip_address_id      = netbox_available_ip_address.ip.id
  virtual_machine_id = netbox_virtual_machine.vm.id
}
