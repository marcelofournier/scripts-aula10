#!/bin/bash

# Função para obter o IP da máquina local
obter_ip_local() {
    # Comando 'ip' com opção 'route' para pegar a rota padrão
    ip=$(ip route | grep default | awk '{print $7}')

    if [ -n "$ip" ]; then
        echo "O endereço IP da máquina local é: $ip"
    else
        echo "Não foi possível obter o endereço IP da máquina local."
    fi
}

obter_ip_local

