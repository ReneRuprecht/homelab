output "vm_id" {
  value = netbox_virtual_machine.vm.id
}

output "ip_address" {
  value = netbox_available_ip_address.ip.ip_address
}

output "primary_ip_id" {
  value = netbox_primary_ip.primary.id
}

