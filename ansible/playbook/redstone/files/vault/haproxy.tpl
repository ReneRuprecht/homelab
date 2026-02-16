{{ with secret "secret/certs/public" }}
{{ .Data.data.pem }}
{{ end }}

