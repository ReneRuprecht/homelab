ROLE=$1
ALLOWED_DOMAINS=$2
ALLOW_SUBDOMAINS=${3:-true}
ROLE_MAX_TTL=${4:-90d}

if [ -z "$ROLE" ] || [ -z "$ALLOWED_DOMAINS" ] || [ -z "$ALLOW_SUBDOMAINS" ] || [ -z "$ROLE_MAX_TTL" ]; then
    echo "Usage: $0 <role-name> \"<allowed-domains>\" <allow-subdomains>  <role-max-ttl>"
    exit 1
fi

vault write pki_int/roles/$ROLE \
     issuer_ref="$(vault read -field=default pki_int/config/issuers)" \
     allowed_domains="$ALLOWED_DOMAINS" \
     allow_subdomains="$ALLOW_SUBDOMAINS" \
     max_ttl="$ROLE_MAX_TTL"

