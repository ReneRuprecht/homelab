path "secret/data/certs/*" {
  capabilities = ["read"]
}

path "pki-int-identity/issue/identity-services" {
  capabilities = ["create", "update"]
}

path "pki-int-secrets/issue/secrets-services" {
  capabilities = ["create", "update"]
}

path "pki-int-core/issue/core-services" {
  capabilities = ["create", "update"]
}
