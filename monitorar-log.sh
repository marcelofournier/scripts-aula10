#!/bin/bash

# Verifica se o arquivo de log existe
log_file="/var/log/syslog" # Altere o caminho para o arquivo de log, se necessário

if [ ! -f "$log_file" ]; then
  echo "O arquivo de log $log_file não foi encontrado."
  exit 1
fi

# Utiliza o tail com a opção -f para acompanhar as alterações no arquivo de log
tail -n 20 -f "$log_file"

