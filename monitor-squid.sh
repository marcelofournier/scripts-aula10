#!/bin/bash

# Definir o arquivo de log a ser monitorado
logfile="/var/log/squid/access.log"

# Verificar se o arquivo de log existe
if [ ! -f "$logfile" ]; then
  echo "Arquivo de log $logfile não encontrado."
  exit 1
fi

# Posicionar o ponteiro do arquivo de log no final
tail -n0 -F "$logfile" | while read line; do
  echo "$line"
done
