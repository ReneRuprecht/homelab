####
# Redstone
####

resource "vault_pki_secret_backend_role" "redstone_services" {
  backend          = "pki-int-redstone"
  name             = "redstone-services"
  allowed_domains  = ["redstone"]
  allow_subdomains = true
  server_flag      = true
  max_ttl          = "7776000"
}

resource "vault_policy" "redstone_pki_sign" {
  depends_on = [vault_pki_secret_backend_role.redstone_services]
  name       = "sign-pki-int-redstone"
  policy     = file("${path.module}/policies/sign-pki-int-redstone.hcl")
}


####
# Bluecore
####

resource "vault_pki_secret_backend_role" "bluecore_services" {
  backend          = "pki-int-bluecore"
  name             = "bluecore-services"
  allowed_domains  = ["bluecore"]
  allow_subdomains = true
  server_flag      = true
  max_ttl          = "7776000"
}

resource "vault_policy" "bluecore_pki_sign" {
  depends_on = [vault_pki_secret_backend_role.bluecore_services]
  name       = "sign-pki-int-bluecore"
  policy     = file("${path.module}/policies/sign-pki-int-bluecore.hcl")
}

####
# External-Secrets
####

resource "vault_policy" "external_secrets" {
  name   = "external-secrets"
  policy = file("${path.module}/policies/external-secrets.hcl")
}

resource "vault_kubernetes_auth_backend_role" "external_secrets_role" {
  depends_on                       = [vault_policy.external_secrets]
  backend                          = "kubernetes"
  role_name                        = "external-secrets"
  bound_service_account_names      = ["external-secrets"]
  bound_service_account_namespaces = ["external-secrets"]
  token_policies                   = [vault_policy.external_secrets.name]
  token_ttl                        = 3600
}


####
# Cert-Manager
####


resource "vault_kubernetes_auth_backend_role" "cert_manager_role" {
  depends_on                       = [vault_policy.redstone_pki_sign, vault_policy.bluecore_pki_sign]
  backend                          = "kubernetes"
  role_name                        = "cert-manager"
  bound_service_account_names      = ["vault-issuer"]
  bound_service_account_namespaces = ["cert-manager"]
  token_policies                   = [vault_policy.bluecore_pki_sign.name, vault_policy.redstone_pki_sign.name]
  token_ttl                        = 3600
}

resource "vault_policy" "cert_reader" {
  name       = "cert-reader"
  policy     = file("${path.module}/policies/cert-reader.hcl")
}

resource "vault_policy" "cert_writer" {
  name       = "cert-writer"
  policy     = file("${path.module}/policies/cert-writer.hcl")
}

resource "vault_policy" "cert_reader_writer" {
  name       = "cert-reader-writer"
  policy     = file("${path.module}/policies/cert-reader-writer.hcl")
}


####
# Vault Snapshot
####

resource "vault_policy" "backup" {
  name       = "backup"
  policy     = file("${path.module}/policies/backup.hcl")
}

####
# Prometheus metrics
####

resource "vault_policy" "prometheus_metrics" {
  name       = "prometheus-metrics"
  policy     = file("${path.module}/policies/prometheus-metrics.hcl")
}
