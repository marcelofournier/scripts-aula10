#!/bin/bash

# Função para realizar o ping em um endereço IP
ping_ip() {
  ip=$1
  ping -c 1 -W 1 "$ip" >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "IP $ip está ativo."
  else
    echo "IP $ip está inativo."
  fi
}

# Verifica se foram fornecidos dois argumentos (IP inicial e final)
if [ $# -ne 2 ]; then
  echo "Uso: $0 <IP_INICIAL> <IP_FINAL>"
  exit 1
fi

# Extrai o IP inicial e o IP final dos parâmetros
ip_inicial=$1
ip_final=$2

# Separa os octetos dos IPs para iterar entre eles
IFS='.' read -ra ip_inicial_octetos <<< "$ip_inicial"
IFS='.' read -ra ip_final_octetos <<< "$ip_final"

# Loop para iterar pelos endereços IP
while true; do
  # Converte os octetos em uma string do endereço IP
  ip=""
  for ((i = 0; i < 4; i++)); do
    ip+="${ip_inicial_octetos[i]}"
    if [ "$i" -lt 3 ]; then
      ip+="."
    fi
  done

  # Verifica se o IP é válido e realiza o ping
  if [[ "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    ping_ip "$ip"
  fi

  # Verifica se chegamos ao IP final
  if [ "$ip" == "$ip_final" ]; then
    break
  fi

  # Incrementa o último octeto do IP atual
  ip_inicial_octetos[3]=$((ip_inicial_octetos[3] + 1))
  for ((i = 3; i > 0; i--)); do
    if [ "${ip_inicial_octetos[i]}" -gt 255 ]; then
      ip_inicial_octetos[i]=0
      ip_inicial_octetos[i - 1]=$((ip_inicial_octetos[i - 1] + 1))
    fi
  done
done

