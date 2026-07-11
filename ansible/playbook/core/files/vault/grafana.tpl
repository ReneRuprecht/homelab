{{ with secret "secret/certs/grafana/cert" }}
{{ .Data.data.pem }}
{{ .Data.data.key }}
{{ end }}

