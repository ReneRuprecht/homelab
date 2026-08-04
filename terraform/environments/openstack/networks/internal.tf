resource "openstack_networking_network_v2" "internal" {
  name           = "internal"
  admin_state_up = true
}

resource "openstack_networking_subnet_v2" "internal" {
  depends_on = [openstack_networking_network_v2.internal]

  name = "internal-subnet"

  network_id = openstack_networking_network_v2.internal.id

  cidr = "172.20.0.0/24"

  ip_version = 4

  gateway_ip = "172.20.0.1"

  dns_nameservers = [
    "10.1.100.11",
    "10.1.100.12"
  ]

  enable_dhcp = true
}
