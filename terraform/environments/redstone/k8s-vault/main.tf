module "netbox_proxmox_vms" {
  source = "../../../modules/netbox_proxmox_vms"

  vm_user     = var.vm_user
  vm_ssh_keys = var.vm_ssh_keys

  vms = var.vms
}

resource "dns_a_record_set" "vms" {
  depends_on = [module.netbox_proxmox_vms]

  for_each = module.netbox_proxmox_vms.proxmox_vms

  zone = "redstone."
  name = split(".redstone", each.key)[0]

  addresses = [
    each.value
  ]

  ttl = 300
}

resource "dns_a_record_set" "vault" {
  zone = "redstone."
  name = "vault"

  addresses = [
    "192.168.178.245"
  ]

  ttl = 300
}
