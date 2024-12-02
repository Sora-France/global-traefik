#!/bin/bash

CERT_DIR="$HOME/.GlobalTraefik/.docker/traefik/certs"
OUTPUT_FILE="$HOME/.GlobalTraefik/.docker/traefik/tls.yml"

echo "tls:" > $OUTPUT_FILE
echo "  certificates:" >> $OUTPUT_FILE

for CERT in $CERT_DIR/*.crt; do
  KEY="${CERT%.crt}.key"
  if [ -f "$KEY" ]; then
    echo "    - certFile: /etc/ssl/traefik/$(basename "$CERT")" >> $OUTPUT_FILE
    echo "      keyFile: /etc/ssl/traefik/$(basename "$KEY")" >> $OUTPUT_FILE
  fi
done
