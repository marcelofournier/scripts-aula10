#!/bin/bash

while true; do
    clear
    echo "==== Gerenciamento de Rede com iftop ===="
    echo "1. Mostrar tráfego por IP"
    echo "2. Mostrar tráfego por porta"
    echo "3. Mostrar tráfego por interface de rede"
    echo "4. Mostrar tráfego resumido"
    echo "0. Sair"

    read -p "Escolha uma opção (1-5): " choice

    case $choice in
        1)
            read -p "Digite o IP para filtrar (ou deixe em branco para mostrar tudo): " ip
            sudo iftop -nNt -i wlp2s0 -F $ip
            ;;
        2)
            read -p "Digite a porta para filtrar (ou deixe em branco para mostrar tudo): " port
            sudo iftop -nNt -i wlp2s0 -f "port $port"
            ;;
        3)
            ip a
            read -p "Digite o nome da interface de rede: " interface
            sudo iftop -nNt -i $interface
            ;;
        4)  ip a
            read -p "informe a interface de rede desejada: " interface
            sudo iftop -nNt -i "$interface"
            ;;
        0)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida. Escolha uma opção válida (1-5)."
            ;;
    esac

    read -p "Pressione Enter para continuar..."
done
