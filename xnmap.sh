#!/bin/bash

# Função para exibir o menu de opções
function exibir_menu() {
    clear
    figlet nmap na rede
    echo
    echo "Menu de Opções:"
    echo "1. Verificar hosts ativos na rede"
    echo "2. Verificar portas abertas em um host"
    echo "3. Escanear uma faixa de IPs"
    echo "4. Verificar o SO de um host"
    echo "0. Sair"
    echo -n "Escolha uma opção: "
}

function aguarde() {
  echo
  read -p "Pressione qualquer tecla para continuar... " tecla
}

# Função para verificar hosts ativos na rede
function verificar_hosts_ativos() {
    
    read -p "Digite o intervalo de IPs para verificar (exemplo: 192.168.0.1-100): " ip_range
    sudo nmap -sn $ip_range
    echo
    aguarde
}

# Função para verificar portas abertas em um host
function verificar_portas_abertas() {
    read -p "Digite o IP do host para verificar as portas abertas: " host_ip
    sudo nmap -p- $host_ip
    echo
    aguarde
}


# Função para escanear uma faixa de IPs
function escanear_faixa_ips() {
    echo
    read -p "Digite a faixa de IPs para escanear (exemplo: 192.168.0.1-100): " ip_range
    sudo nmap -p 22,80,443 $ip_range
    echo
    aguarde
}

# Função para verificar o SO de um host
function verificar_so_host() {
    echo
    read -p "Digite o IP do host para verificar o SO: " host_ip
    sudo nmap -O $host_ip
    echo
    aguarde
}

# Loop principal do script
while true; do
    clear
    exibir_menu

    read opcao

    case $opcao in
        1)
            verificar_hosts_ativos
            aguarde;;
        2)
            verificar_portas_abertas
            aguarde;;
        3)
            escanear_faixa_ips
            aguarde;;
        4)
            verificar_so_host
            aguarde;;
        0)
            exit 0;;
        *)
            echo "Opção inválida. Escolha novamente."
            ;;
    esac
done
