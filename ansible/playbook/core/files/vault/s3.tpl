{{ with secret "secret/certs/s3/cert" }}
{{ .Data.data.pem }}
{{ .Data.data.key }}
{{ end }}

