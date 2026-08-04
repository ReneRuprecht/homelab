resource "openstack_compute_flavor_v2" "gp1_xsmall" {
  name      = "gp1.xsmall"
  ram       = "1024"
  vcpus     = "1"
  disk      = "10"
  is_public = true
}

resource "openstack_compute_flavor_v2" "gp1_small" {
  name      = "gp1.small"
  ram       = "2048"
  vcpus     = "2"
  disk      = "20"
  is_public = true
}
