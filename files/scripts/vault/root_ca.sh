if [ -z "$VAULT_ADDR" ]; then
    echo "Set VAULT_ADDR"
    exit 1
fi

vault secrets enable pki
vault secrets tune -max-lease-ttl=87600h pki
vault write -field=certificate pki/root/generate/internal \
     common_name="redstone Root Authority" \
     issuer_name="root-internal" \
     ttl=87600h > root_internal_ca.crt
vault write pki/roles/root-internal allow_any_name=true
vault write pki/config/urls \
     issuing_certificates="$VAULT_ADDR/v1/pki/ca" \
     crl_distribution_points="$VAULT_ADDR/v1/pki/crl"
