{{ with secret "secret/certs/keycloak/cert" }}
{{ .Data.data.pem }}
{{ .Data.data.key }}
{{ end }}

