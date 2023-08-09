#!/bin/bash

while true; do
    clear
    echo "Usuários logados na máquina local e seus respectivos IPs:"
    echo "---------------------------------------------------------"
    who | awk '{print $1, $5}'
    sleep 30  # intervalo de atualização em segundos (pode ser ajustado)
done
