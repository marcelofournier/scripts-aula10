#!/bin/bash

# Função para exibir o dashboard
function show_dashboard() {
  tput clear
  echo "==========================="
  echo " Dashboard - Hosts Ativos  "
  echo "==========================="
  echo

  # Executa o Nmap na rede local e filtra hosts ativos
  date 
  nmap -sn 192.168.15.0/24 | grep "report" | awk '{print $5}' > hosts.txt

  if [ -s hosts.txt ]; then
    echo "Hosts Ativos:"
    cat hosts.txt
  else
    echo "Nenhum host ativo encontrado."
  fi

  # Aguarda por n minutos antes de atualizar o dashboard
  sleep 300 # 5 minutos
  show_dashboard
}

# Executa a função para exibir o dashboard
show_dashboard
