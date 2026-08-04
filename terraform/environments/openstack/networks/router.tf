resource "openstack_networking_router_v2" "internal" {
  depends_on     = [openstack_networking_network_v2.external]
  admin_state_up = true

  name = "internal-router"
  external_fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.external.id
    ip_address = "10.3.100.2"
  }

  external_network_id = openstack_networking_network_v2.external.id
}

resource "openstack_networking_router_interface_v2" "internal" {
  depends_on = [openstack_networking_router_v2.internal, openstack_networking_subnet_v2.internal]
  router_id  = openstack_networking_router_v2.internal.id
  subnet_id  = openstack_networking_subnet_v2.internal.id
}
