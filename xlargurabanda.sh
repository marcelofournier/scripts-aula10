#!/bin/bash

linha() {
    echo "------------------------------------------------------------------"
}

aguarde() {
    echo
    read -p "Pressione qualquer tecla para continuar..."
    echo
}

while true; do
    clear
    figlet "Largura banda"
    linha
    echo "Menu de Opções - Avaliação da largura de banda, latência e jitter"
    linha
    echo "1. Iniciar servidor para medir a largura de banda"
    echo "2. Iniciar cliente para medir a largura de banda (abra em outro pc)"
    echo "3. Habilitar Porta no Firewall"
    echo "4. LAN / MAN -> Avaliar a latência entre 2 pontos de rede"
    echo "5. WAN -> Avaliar a latência e o jitter na WAN (outros paises)"
    echo "6. Abrir site para teste de latencia, jitter e perda de dados"
    echo "7. Abrir site para visualizar cabos de fibra óptica submarinos pelo mundo"
    echo "8. Abrir site para visualizar ataques hackers pelo mundo neste momento"
    echo "99. Obter ajuda sobre este item"
    echo "0. Sair"
    linha
    read -p "Escolha uma opção: " choice

    case $choice in
        1)  iperf -s;;
        2)  read -p "Digite o endereço IP do servidor: " server_ip
            iperf -c "$server_ip"
            ;;
        3)  read -p "Digite o número da porta para habilitar no firewall: " port_number
            sudo iptables -A INPUT -p tcp --dport "$port_number" -j ACCEPT
            echo "Porta $port_number habilitada no firewall."
            ;;
        4)  clear
            figlet latencia jitter
            linha
            echo "Avaliando a latência e o jitter na rede"
            linha
            read -p "Informe o endereço IP de destino: " IP
            ping -i 0.1 -c 50 $IP
            aguarde;;

        5)  ./latencia-pais.sh;;

        6)  url="https://speed.cloudflare.com/"
            xdg-open "$url"
            aguarde
            ;;

        7)  url="https://www.submarinecablemap.com/ready-for-service/2023"
            xdg-open "$url";;
        8)  url="https://cybermap.kaspersky.com/"
            xdg-open "$url";;
        99) clear
            figlet "Ajuda"
            linha
            cat latencia-jitter.txt | more;;
        0)  exit 0
            ;;
        *)
            echo "Opção inválida. Por favor, escolha uma opção válida."
            ;;
    esac

    read -p "Pressione Enter para continuar..."
done
