resource "vault_mount" "redstone" {
  path                  = "pki-int-redstone"
  type                  = "pki"
  max_lease_ttl_seconds = 315360000
}

resource "vault_pki_secret_backend_intermediate_cert_request" "redstone_csr" {
  backend     = vault_mount.redstone.path
  common_name = "Homelab Redstone Intermediate CA"
  type        = "internal"
}

resource "vault_pki_secret_backend_root_sign_intermediate" "redstone" {
  depends_on  = [vault_pki_secret_backend_intermediate_cert_request.redstone_csr]
  backend     = "pki-root-homelab"
  csr         = vault_pki_secret_backend_intermediate_cert_request.redstone_csr.csr
  common_name = "Homelab Redstone Intermediate CA"
}

resource "vault_pki_secret_backend_intermediate_set_signed" "redstone_signed" {
  backend     = vault_mount.redstone.path
  certificate = resource.vault_pki_secret_backend_root_sign_intermediate.redstone.certificate
}

###########
# Bluecore
###########

resource "vault_mount" "bluecore" {
  path                  = "pki-int-bluecore"
  type                  = "pki"
  max_lease_ttl_seconds = 315360000
}

resource "vault_pki_secret_backend_intermediate_cert_request" "bluecore_csr" {
  backend     = vault_mount.bluecore.path
  common_name = "Homelab Bluecore Intermediate CA"
  type        = "internal"
}

resource "vault_pki_secret_backend_root_sign_intermediate" "bluecore" {
  depends_on  = [vault_pki_secret_backend_intermediate_cert_request.bluecore_csr]
  backend     = "pki-root-homelab"
  csr         = vault_pki_secret_backend_intermediate_cert_request.bluecore_csr.csr
  common_name = "Homelab Bluecore Intermediate CA"
}

resource "vault_pki_secret_backend_intermediate_set_signed" "bluecore_signed" {
  backend     = vault_mount.bluecore.path
  certificate = resource.vault_pki_secret_backend_root_sign_intermediate.bluecore.certificate
}
