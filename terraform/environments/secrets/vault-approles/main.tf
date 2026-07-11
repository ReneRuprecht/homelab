resource "vault_approle_auth_backend_role" "haproxy" {
  backend = "approle"

  role_name = "haproxy"

  token_policies = [
    "haproxy-cert-reader"
  ]

  token_ttl     = 3600
  token_max_ttl = 14400
}

resource "vault_approle_auth_backend_role" "prometheus-metrics" {
  backend = "approle"

  role_name = "prometheus-metrics"

  token_policies = [
    "prometheus-metrics"
  ]

  token_ttl     = 3600
  token_max_ttl = 14400
}
