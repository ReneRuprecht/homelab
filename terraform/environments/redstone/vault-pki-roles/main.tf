####
# Approle
####

resource "vault_auth_backend" "approle" {
  type = "approle"
}

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
  name   = "cert-reader"
  policy = file("${path.module}/policies/cert-reader.hcl")
}

resource "vault_approle_auth_backend_role" "cert_reader_approle" {
  depends_on     = [vault_policy.cert_reader]
  backend        = vault_auth_backend.approle.path
  role_name      = "cert-reader"
  token_policies = [vault_policy.cert_reader.name]
  token_ttl      = 1200
  token_max_ttl  = 1800
}

resource "vault_policy" "cert_writer" {
  name   = "cert-writer"
  policy = file("${path.module}/policies/cert-writer.hcl")
}

resource "vault_approle_auth_backend_role" "cert_writer_approle" {
  depends_on     = [vault_policy.cert_writer]
  backend        = vault_auth_backend.approle.path
  role_name      = "cert-writer"
  token_policies = [vault_policy.cert_writer.name]
  token_ttl      = 1200
  token_max_ttl  = 1800
}

resource "vault_policy" "cert_reader_writer" {
  name   = "cert-reader-writer"
  policy = file("${path.module}/policies/cert-reader-writer.hcl")
}

resource "vault_approle_auth_backend_role" "cert_reader_writer_approle" {
  depends_on     = [vault_policy.cert_reader_writer]
  backend        = vault_auth_backend.approle.path
  role_name      = "cert-reader-writer"
  token_policies = [vault_policy.cert_reader_writer.name]
  token_ttl      = 1200
  token_max_ttl  = 1800
}


####
# Vault Snapshot
####

resource "vault_policy" "backup" {
  name   = "backup"
  policy = file("${path.module}/policies/backup.hcl")
}

resource "vault_approle_auth_backend_role" "backup_approle" {
  depends_on     = [vault_policy.backup]
  backend        = vault_auth_backend.approle.path
  role_name      = "backup"
  token_policies = [vault_policy.backup.name]
  token_ttl      = 1200
  token_max_ttl  = 1800
}

####
# Prometheus metrics
####

resource "vault_policy" "prometheus_metrics" {
  name   = "prometheus-metrics"
  policy = file("${path.module}/policies/prometheus-metrics.hcl")
}

resource "vault_approle_auth_backend_role" "prometheus_metrics_approle" {
  depends_on     = [vault_policy.prometheus_metrics]
  backend        = vault_auth_backend.approle.path
  role_name      = "prometheus-metrics"
  token_policies = [vault_policy.prometheus_metrics.name]
  token_ttl      = 1200
  token_max_ttl  = 1800
}
