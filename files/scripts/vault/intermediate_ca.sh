PKI_NAME="int_pki_"$1
PKI_CN=$2
PKI_ISSUER=$3
PKI_ISSUER_REF=$4
ROOT_PKI=$5

if [ -z "$PKI_NAME" ] || [ -z "$PKI_CN" ] || [ -z "$PKI_ISSUER" ] || [ -z "$PKI_ISSUER_REF" ] || [ -z "$ROOT_PKI" ]; then
    echo "Usage: $0 <pki-name> <pki-cn> <pki-issuer> <pki-issuer-ref> <root-pki>"
    echo ""
    echo "info:"
    echo "    pki_name prefis: 'int_pki_'"
    exit 1
fi

vault secrets enable -path=$PKI_NAME pki
vault secrets tune -max-lease-ttl=43800h $PKI_NAME
vault write -format=json "$PKI_NAME"/intermediate/generate/internal \
     common_name="$PKI_CN" \
     issuer_name="$PKI_ISSUER" \
     | jq -r '.data.csr' > "$PKI_NAME".csr
vault write -format=json "$ROOT_PKI"/root/sign-intermediate \
     issuer_ref="$PKI_ISSUER_REF" \
     csr=@"$PKI_NAME".csr \
     format=pem_bundle ttl="43800h" \
     | jq -r '.data.certificate' > "$PKI_NAME".cert.pem
vault write $PKI_NAME/intermediate/set-signed certificate=@$PKI_NAME.cert.pem
