resource "vault_pki_secret_backend_role" "core_services" {
  backend          = "pki-int-core"
  name             = "core-services"
  allowed_domains  = ["core.internal"]

  allow_subdomains = true
  allow_bare_domains = false

  server_flag = true
  client_flag = false

  enforce_hostnames = true

  key_type = "rsa"
  key_bits = 4096

  max_ttl = 7776000
  ttl     = 7776000
}

resource "vault_policy" "core_pki_sign" {
  depends_on = [vault_pki_secret_backend_role.core_services]
  name       = "sign-pki-int-core"
  policy     = file("${path.module}/policies/sign-pki-int-core.hcl")
}



resource "vault_pki_secret_backend_role" "identity_services" {
  backend          = "pki-int-identity"
  name             = "identity-services"
  allowed_domains  = ["identity.internal"]

  allow_subdomains = true
  allow_bare_domains = false

  server_flag = true
  client_flag = false

  enforce_hostnames = true

  key_type = "rsa"
  key_bits = 4096

  max_ttl = 7776000
  ttl     = 7776000
}

resource "vault_policy" "identity_pki_sign" {
  depends_on = [vault_pki_secret_backend_role.identity_services]
  name       = "sign-pki-int-identity"
  policy     = file("${path.module}/policies/sign-pki-int-identity.hcl")
}



resource "vault_pki_secret_backend_role" "secrets_services" {
  backend          = "pki-int-secrets"
  name             = "secrets-services"
  allowed_domains  = ["secrets.internal"]

  allow_subdomains = true
  allow_bare_domains = false

  server_flag = true
  client_flag = false

  enforce_hostnames = true

  key_type = "rsa"
  key_bits = 4096

  max_ttl = 7776000
  ttl     = 7776000
}

resource "vault_policy" "secrets_pki_sign" {
  depends_on = [vault_pki_secret_backend_role.secrets_services]
  name       = "sign-pki-int-secrets"
  policy     = file("${path.module}/policies/sign-pki-int-secrets.hcl")
}
