{{ with pkiCert "pki-int-core/issue/core-services" "common_name=elastic.core.internal" "alt_names=elastic-01.core.internal,elastic-02.core.internal,elastic-03.core.internal,fleet.core.internal,kibana.core.internal,elasticsearch.core.internal" "ip_sans=10.1.100.20,10.1.100.21,10.1.100.22" }}
{{ .Key  | writeToFile "/etc/elasticsearch/certs/transport.key"  "elasticsearch" "elasticsearch" "0600" }}
{{ .Cert | writeToFile "/etc/elasticsearch/certs/transport.crt" "elasticsearch" "elasticsearch" "0640" }}
{{ .CA   | writeToFile "/etc/elasticsearch/certs/ca.crt"   "elasticsearch" "elasticsearch" "0640" }}
{{ end }}
