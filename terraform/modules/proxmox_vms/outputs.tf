output "vms" {
  description = "Informationen zu allen erstellten VMs"
  value = {
    for vm_name, vm_resource in proxmox_vm_qemu.vm :
    vm_name => {
      id     = vm_resource.id
      name   = vm_resource.name
      vmid   = vm_resource.vmid
      ip     = try(vm_resource.default_ipv4_address, null)
      status = vm_resource.vm_state
    }
  }
}
