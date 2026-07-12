{{ with pkiCert "pki-int-core/issue/core-services" "common_name=grafana.core.internal" "alt_names=prometheus.core.internal,monitoring-01.core.internal" }}
{{ .Cert }}
{{ .CA }}
{{ .Key }}
{{ end }}

