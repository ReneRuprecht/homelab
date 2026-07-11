resource "vault_policy" "backup" {
  name   = "haproxy-cert-reader"
  policy = file("${path.module}/policies/haproxy-cert-reader.hcl")
}
