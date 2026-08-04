resource "openstack_compute_keypair_v2" "ansible" {
  name       = "ansible"
  public_key = var.os_ansible_ssh_key
}
