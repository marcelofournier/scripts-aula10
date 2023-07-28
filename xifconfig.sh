#!/bin/bash

# Função para exibir o menu
show_menu() {
    clear
    echo "======== Menu de Administração de Rede ========"
    echo "1. Exibir informações de todas as interfaces"
    echo "2. Exibir informações de uma interface específica"
    echo "3. Ativar ou desativar uma interface de rede"
    echo "4. Configurar o endereço IP de uma interface"
    echo "5. Sair"
    echo "=============================================="
}

# Função para exibir informações de todas as interfaces
show_all_interfaces() {
    ifconfig -a
}

# Função para exibir informações de uma interface específica
show_interface_info() {
    echo "Interfaces de rede disponíveis:"
    echo
    select interface in $(ifconfig | grep -o '^[^[:space:]:]\+'); do
        ifconfig $interface
        break
    done
}

# Função para ativar ou desativar uma interface de rede
toggle_interface() {
    echo "Interfaces de rede disponíveis:"
    echo
    select interface in $(ifconfig | grep -o '^[^[:space:]:]\+'); do
        read -p "Deseja ativar ou desativar a interface $interface? (on/off): " choice
        case $choice in
            on) ifconfig $interface up ;;
            off) ifconfig $interface down ;;
            *) echo "Opção inválida. Tente novamente." ;;
        esac
        break
    done
}

# Função para configurar o endereço IP de uma interface
configure_ip_address() {
    echo "Interfaces de rede disponíveis:"
    echo
    select interface in $(ifconfig | grep -o '^[^[:space:]:]\+'); do
        echo "mostrando o IP atual:"
        ip a
        read -p "Digite o endereço IP para a interface $interface (exemplo: 192.168.1.10): " ip_address
        ifconfig $interface $ip_address
        echo "Endereço IP da interface $interface configurado para $ip_address."
        break
    done
}

# Loop principal do script
while true; do
    show_menu
    read -p "Escolha uma opção: " choice

    case $choice in
        1) show_all_interfaces ;;
        2) show_interface_info ;;
        3) toggle_interface ;;
        4) configure_ip_address ;;
        5) echo "Saindo..."; break ;;
        *) echo "Opção inválida. Tente novamente." ;;
    esac

    read -p "Pressione Enter para continuar..."
done

