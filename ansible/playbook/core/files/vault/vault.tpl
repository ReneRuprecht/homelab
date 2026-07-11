{{ with secret "secret/certs/vault/cert" }}
{{ .Data.data.pem }}
{{ .Data.data.key }}
{{ end }}

