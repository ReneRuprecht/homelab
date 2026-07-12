{{ with pkiCert "pki-int-core/issue/core-services" "common_name=s3.core.internal" }}
{{ .Cert }}
{{ .CA }}
{{ .Key }}
{{ end }}

