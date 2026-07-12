{{ with pkiCert "pki-int-secrets/issue/secrets-services" "common_name=vault.secrets.internal" "alt_names=vault-01.secrets.internal,vault-02.secrets.internal,vault-03.secrets.internal" }}
{{ .Cert }}
{{ .CA }}
{{ .Key }}
{{ end }}

