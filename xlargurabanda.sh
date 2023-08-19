#!/bin/bash

linha() {
    echo "------------------------------------------------------------------"
}

while true; do
    clear
    figlet "Largura banda"
    linha
    echo "Menu de Opções - Teste de Largura de Banda com iperf"
    linha
    echo "1. Iniciar Servidor iperf"
    echo "2. Iniciar Cliente iperf"
    echo "3. Habilitar Porta no Firewall"
    echo "0. Sair"
    linha
    read -p "Escolha uma opção: " choice

    case $choice in
        1)
            iperf -s
            ;;
        2)
            read -p "Digite o endereço IP do servidor: " server_ip
            iperf -c "$server_ip"
            ;;
        3)
            read -p "Digite o número da porta para habilitar no firewall: " port_number
            sudo iptables -A INPUT -p tcp --dport "$port_number" -j ACCEPT
            echo "Porta $port_number habilitada no firewall."
            ;;
        0)  exit 0
            ;;
        *)
            echo "Opção inválida. Por favor, escolha uma opção válida."
            ;;
    esac

    read -p "Pressione Enter para continuar..."
done
