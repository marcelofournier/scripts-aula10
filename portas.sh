#!/bin/bash

# Verifica se foi fornecido um endereço IP como argumento
if [ $# -ne 1 ]; then
  echo "Uso: $0 <ENDEREÇO_IP>"
  exit 1
fi

ip="$1"

# Função para verificar uma porta específica
check_port() {
  port="$1"
  nc -zvw1 "$ip" "$port" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "Porta $port está aberta."
  else
    echo "Porta $port está fechada."
  fi
}

# Lista de portas a serem verificadas
ports=(80 443 22 21 3306)

echo "Verificando as portas abertas em $ip:"
for port in "${ports[@]}"; do
  check_port "$port"
done

