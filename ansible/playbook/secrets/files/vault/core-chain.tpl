{{ with secret "pki-int-core/cert/ca" }}
{{ .Data.certificate }}
{{ end }}

{{ with secret "pki-root/cert/ca" }}
{{ .Data.certificate }}
{{ end }}
