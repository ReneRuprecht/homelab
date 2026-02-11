ROLE=$1
COMMON_NAME=$2
OUTPUT_DIR=$2
JSON_FILE="$2.response.json"
ALT_NAMES=$3

if [ -z "$ROLE" ] || [ -z "$COMMON_NAME" ]; then
    echo "Usage: $0 <role-name> <common-name> \"<alt-name>,<alt-name>\"" 
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

vault write -format=json pki_int/issue/$ROLE common_name="$COMMON_NAME" alt_names="$ALT_NAMES" ttl="90d" > "$JSON_FILE"

PRIVATE_KEY=$(jq -r '.data.private_key' "$JSON_FILE")
CERTIFICATE=$(jq -r '.data.certificate' "$JSON_FILE")
CA_CHAIN=$(jq -r '.data.ca_chain | join("\n")' "$JSON_FILE")

# Intermediate CA ist das erste Element im ca_chain array
INTERMEDIATE_CA=$(jq -r '.data.ca_chain[0]' "$JSON_FILE")
ROOT_CA=$(jq -r '.data.ca_chain[1]' "$JSON_FILE")

# Private Key
echo "$PRIVATE_KEY" > "$OUTPUT_DIR/server.key"
chmod 600 "$OUTPUT_DIR/server.key"

# Fullchain = Server Cert + Intermediate
echo "$CERTIFICATE" > "$OUTPUT_DIR/fullchain.pem"
echo "$INTERMEDIATE_CA" >> "$OUTPUT_DIR/fullchain.pem"

# CA Datei für CLI
echo "$INTERMEDIATE_CA" > "$OUTPUT_DIR/ca.crt"

# Root CA Datei für Systemstore
echo "$ROOT_CA" > "$OUTPUT_DIR/root_ca.crt"

echo "TLS Dateien wurden erzeugt im Ordner '$OUTPUT_DIR':"
echo " - server.key"
echo " - fullchain.pem (Server + Intermediate)"
echo " - ca.crt (für Clients / VAULT_CACERT)"
echo " - root_ca.crt (für Systemstore)"
