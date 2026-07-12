{{ with pkiCert "pki-int-identity/issue/identity-services" "common_name=keycloak.identity.internal" "alt_names=keycloak-01.identity.internal" }}
{{ .Cert }}
{{ .CA }}
{{ .Key }}
{{ end }}

