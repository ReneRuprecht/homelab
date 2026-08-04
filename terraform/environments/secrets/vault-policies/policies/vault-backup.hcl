path "sys/storage/raft/snapshot" {
  capabilities = ["read", "update"]
}

path "pki-root/cert/ca" {
  capabilities = ["read"]
}
