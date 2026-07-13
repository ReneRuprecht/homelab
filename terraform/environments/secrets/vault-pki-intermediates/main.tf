### 
# Core
###
resource "vault_mount" "core" {
  path                  = "pki-int-core"
  type                  = "pki"
  max_lease_ttl_seconds = 157680000
  description           = "Homelab Core Intermediate Certificate Authority"
}

resource "vault_pki_secret_backend_intermediate_cert_request" "core_csr" {
  backend     = vault_mount.core.path
  common_name = "Homelab Core Intermediate CA"
  type        = "internal"
}

resource "vault_pki_secret_backend_root_sign_intermediate" "core" {
  depends_on  = [vault_pki_secret_backend_intermediate_cert_request.core_csr]
  backend     = "pki-root"
  csr         = vault_pki_secret_backend_intermediate_cert_request.core_csr.csr
  common_name = "Homelab Core Intermediate CA"

  ttl = 157680000
}

resource "vault_pki_secret_backend_intermediate_set_signed" "core_signed" {
  backend     = vault_mount.core.path
  certificate = resource.vault_pki_secret_backend_root_sign_intermediate.core.certificate
}


### 
# Identity
###
resource "vault_mount" "identity" {
  path                  = "pki-int-identity"
  type                  = "pki"
  max_lease_ttl_seconds = 157680000
  description           = "Homelab Identity Intermediate Certificate Authority"
}

resource "vault_pki_secret_backend_intermediate_cert_request" "identity_csr" {
  backend     = vault_mount.identity.path
  common_name = "Homelab Identity Intermediate CA"
  type        = "internal"
}

resource "vault_pki_secret_backend_root_sign_intermediate" "identity" {
  depends_on  = [vault_pki_secret_backend_intermediate_cert_request.identity_csr]
  backend     = "pki-root"
  csr         = vault_pki_secret_backend_intermediate_cert_request.identity_csr.csr
  common_name = "Homelab Identity Intermediate CA"

  ttl = 157680000
}

resource "vault_pki_secret_backend_intermediate_set_signed" "identity_signed" {
  backend     = vault_mount.identity.path
  certificate = resource.vault_pki_secret_backend_root_sign_intermediate.identity.certificate
}


### 
# Secrets
###
resource "vault_mount" "secrets" {
  path                  = "pki-int-secrets"
  type                  = "pki"
  max_lease_ttl_seconds = 157680000
  description           = "Homelab Secrets Intermediate Certificate Authority"
}

resource "vault_pki_secret_backend_intermediate_cert_request" "secrets_csr" {
  backend     = vault_mount.secrets.path
  common_name = "Homelab Identity Intermediate CA"
  type        = "internal"
}

resource "vault_pki_secret_backend_root_sign_intermediate" "secrets" {
  depends_on  = [vault_pki_secret_backend_intermediate_cert_request.secrets_csr]
  backend     = "pki-root"
  csr         = vault_pki_secret_backend_intermediate_cert_request.secrets_csr.csr
  common_name = "Homelab Secrets Intermediate CA"

  ttl = 157680000
}

resource "vault_pki_secret_backend_intermediate_set_signed" "secrets_signed" {
  backend     = vault_mount.secrets.path
  certificate = resource.vault_pki_secret_backend_root_sign_intermediate.secrets.certificate
}


### 
# Redstone
###
resource "vault_mount" "redstone" {
  path                  = "pki-int-redstone"
  type                  = "pki"
  max_lease_ttl_seconds = 157680000
  description           = "Homelab Redstone Intermediate Certificate Authority"
}

resource "vault_pki_secret_backend_intermediate_cert_request" "redstone_csr" {
  backend     = vault_mount.redstone.path
  common_name = "Homelab Redstone Intermediate CA"
  type        = "internal"
}

resource "vault_pki_secret_backend_root_sign_intermediate" "redstone" {
  depends_on  = [vault_pki_secret_backend_intermediate_cert_request.redstone_csr]
  backend     = "pki-root"
  csr         = vault_pki_secret_backend_intermediate_cert_request.redstone_csr.csr
  common_name = "Homelab Redstone Intermediate CA"

  ttl = 157680000
}

resource "vault_pki_secret_backend_intermediate_set_signed" "redstone_signed" {
  backend     = vault_mount.redstone.path
  certificate = resource.vault_pki_secret_backend_root_sign_intermediate.redstone.certificate
}

### 
# Bluecore
###
resource "vault_mount" "bluecore" {
  path                  = "pki-int-bluecore"
  type                  = "pki"
  max_lease_ttl_seconds = 157680000
  description           = "Homelab Bluecore Intermediate Certificate Authority"
}

resource "vault_pki_secret_backend_intermediate_cert_request" "bluecore_csr" {
  backend     = vault_mount.bluecore.path
  common_name = "Homelab Bluecore Intermediate CA"
  type        = "internal"
}

resource "vault_pki_secret_backend_root_sign_intermediate" "bluecore" {
  depends_on  = [vault_pki_secret_backend_intermediate_cert_request.bluecore_csr]
  backend     = "pki-root"
  csr         = vault_pki_secret_backend_intermediate_cert_request.bluecore_csr.csr
  common_name = "Homelab Bluecore Intermediate CA"

  ttl = 157680000
}

resource "vault_pki_secret_backend_intermediate_set_signed" "bluecore_signed" {
  backend     = vault_mount.bluecore.path
  certificate = resource.vault_pki_secret_backend_root_sign_intermediate.bluecore.certificate
}
