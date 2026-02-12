ROLE=$1
PKI_NAME=$2
ALLOWED_DOMAINS=$3
ALLOW_SUBDOMAINS=${4:-true}
ROLE_MAX_TTL=${5:-90d}

if [ -z "$ROLE" ] || [ -z "$PKI_NAME" ] || [ -z "$ALLOWED_DOMAINS" ] || [ -z "$ALLOW_SUBDOMAINS" ] || [ -z "$ROLE_MAX_TTL" ]; then
    echo "Usage: $0 <role-name> <pki-name> \"<allowed-domains>\" <allow-subdomains>  <role-max-ttl>"
    echo ""
    echo "defaults:"
    echo "	allow_subdomains: true"
    echo "	max_ttl: 90d"
    exit 1
fi

vault write $PKI_NAME/roles/$ROLE \
     issuer_ref="$(vault read -field=default $PKI_NAME/config/issuers)" \
     allowed_domains="$ALLOWED_DOMAINS" \
     allow_subdomains="$ALLOW_SUBDOMAINS" \
     max_ttl="$ROLE_MAX_TTL"
