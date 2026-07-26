{{ with pkiCert "pki-int-core/issue/core-services" "common_name=kibana.core.internal" "alt_names=elastic-01.core.internal,elastic-02.core.internal,elastic-03.core.internal,elasticsearch.core.internal,elastic.core.internal,fleet.core.internal" }}
{{ .Cert }}
{{ .CA }}
{{ .Key }}
{{ end }}

