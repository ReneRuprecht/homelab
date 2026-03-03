output "info" {
  description = "VM Info"
  value = {
    id       = proxmox_vm_qemu.vm.vmid
    name     = proxmox_vm_qemu.vm.name
    ipconfig = proxmox_vm_qemu.vm.ipconfig0
    ip       = var.vm_ip
  }
}
