#!/bin/bash

CERT_DIR="$HOME/.GlobalTraefik/.docker/traefik/certs"
OUTPUT_FILE="$HOME/.GlobalTraefik/.docker/traefik/tls.yml"

echo "tls:" > $OUTPUT_FILE
echo "  certificates:" >> $OUTPUT_FILE

for CERT in $CERT_DIR/*.crt; do
  KEY="${CERT%.crt}.key"
  if [ -f "$KEY" ]; then
    echo "    - certFile: /etc/traefik/certs/$(basename "$CERT")" >> $OUTPUT_FILE
    echo "      keyFile: /etc/traefik/certs/$(basename "$KEY")" >> $OUTPUT_FILE
  else
    echo "No such file $(basename "$KEY") to fit $(basename "$CERT") in $CERT_DIR"
  fi
done
