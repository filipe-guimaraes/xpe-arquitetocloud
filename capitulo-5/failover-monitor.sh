#!/bin/bash

LOG_FILE="failover.log"
URL="http://www.multicloud.awsdiretoaoponto.com.br"

echo "📡 Monitorando failover para: $URL"
echo "Logs sendo salvos em: $LOG_FILE"
echo ""

while true; do
  TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
  IP=$(dig +short www.multicloud.awsdiretoaoponto.com.br | head -n 1)
  CONTENT=$(curl -s --max-time 2 $URL)

  OUTPUT="[$TIMESTAMP] IP: $IP | Conteúdo: $CONTENT"
  echo "$OUTPUT"
  echo "$OUTPUT" >> "$LOG_FILE"

  sleep 5
done