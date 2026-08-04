resource "openstack_networking_network_v2" "external" {
  name           = "external"
  external       = true
  admin_state_up = true

  segments {
    physical_network = "physnet1"
    network_type     = "vlan"
    segmentation_id  = 300
  }

}

resource "openstack_networking_subnet_v2" "external" {
  depends_on = [openstack_networking_network_v2.external]

  name = "external-subnet"

  network_id = openstack_networking_network_v2.external.id

  cidr = "10.3.100.0/24"

  ip_version = 4

  gateway_ip = "10.3.100.1"

  enable_dhcp = false

}
