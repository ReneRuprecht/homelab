resource "vault_policy" "haproxy-cert-reader" {
  name   = "haproxy-cert-reader"
  policy = file("${path.module}/policies/haproxy-cert-reader.hcl")
}

resource "vault_policy" "prometheus-metrics" {
  name   = "prometheus-metrics"
  policy = file("${path.module}/policies/prometheus-metrics.hcl")
}
