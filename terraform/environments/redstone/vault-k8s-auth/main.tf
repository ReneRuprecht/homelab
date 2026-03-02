resource "vault_auth_backend" "k8s" {
  type = "kubernetes"
  path = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "k8s" {
  depends_on         = [vault_auth_backend.k8s]
  backend            = vault_auth_backend.k8s.path
  kubernetes_host    = var.k8s_host
  kubernetes_ca_cert = base64decode(var.k8s_ca_cert)
}
