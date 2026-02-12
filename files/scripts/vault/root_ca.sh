ROOT_PKI_NAME="root_pki_"$1
ROOT_PKI_CN=$2
ROOT_PKI_ISSUER=$3
ROOT_PKI_ROLE=$4

if [ -z "$VAULT_ADDR" ]; then
    echo "Set VAULT_ADDR"
    exit 1
fi

if [ -z "$ROOT_PKI_NAME" ] || [ -z "$ROOT_PKI_CN" ] || [ -z "$ROOT_PKI_ISSUER" ] || [ -z "$ROOT_PKI_ROLE" ]; then
    echo "Usage: $0 <root-pki-name> <root-pki-cn> <root-pki-issuer> <root-pki-role>"
    echo ""
    echo "info:"
    echo "    pki_name prefis: 'root_pki_'"
    exit 1
fi

vault secrets enable -path="$ROOT_PKI_NAME" pki
vault secrets tune -max-lease-ttl=87600h $ROOT_PKI_NAME
vault write -field=certificate $ROOT_PKI_NAME/root/generate/internal \
     common_name="$ROOT_PKI_CN" \
     issuer_name="$ROOT_PKI_ISSUER" \
     ttl=87600h > "$ROOT_PKI_NAME"_internal_ca.crt
vault write $ROOT_PKI_NAME/roles/$ROOT_PKI_ROLE allow_any_name=true
vault write $ROOT_PKI_NAME/config/urls \
     issuing_certificates="$VAULT_ADDR/v1/$ROOT_PKI_NAME/ca" \
     crl_distribution_points="$VAULT_ADDR/v1/$ROOT_PKI_NAME/crl"
