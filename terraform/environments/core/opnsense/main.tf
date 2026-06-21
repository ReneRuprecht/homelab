locals {
  hosts = {
    "opnsense-01.core.internal" = "192.168.178.80"
  }
}

resource "dns_a_record_set" "vms" {

  for_each = local.hosts

  zone = "core.internal."
  name = split(".core.internal", each.key)[0]

  addresses = [
    each.value
  ]

  ttl = 300
}
