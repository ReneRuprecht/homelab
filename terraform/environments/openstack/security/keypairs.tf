resource "openstack_compute_keypair_v2" "ansible" {
  name       = "ansible"
  public_key = var.ssh_public_key
}
