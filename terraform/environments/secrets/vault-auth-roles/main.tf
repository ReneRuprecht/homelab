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
  backend                          = "kubernetes"
  role_name                        = "cert-manager"
  bound_service_account_names      = ["vault-issuer"]
  bound_service_account_namespaces = ["cert-manager"]
  token_policies                   = ["sign-pki-int-redstone", "sign-pki-int-bluecore"]
  token_ttl                        = 3600
}

