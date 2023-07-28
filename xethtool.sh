#!/bin/bash

# Função para exibir o menu
show_menu() {
    clear
    echo "======== Menu de Administração de Rede ========"
    echo "1. Exibir informações da interface de rede"
    echo "2. Alterar velocidade da interface de rede"
    echo "3. Habilitar ou desabilitar Wake-on-LAN"
    echo "4. Exibir estatísticas de erros da interface"
    echo "5. Sair"
    echo "=============================================="
}

# Função para exibir informações da interface de rede
show_interface_info() {
    echo "Interfaces de rede disponíveis:"
    echo
    ethtool -i $(ls /sys/class/net)
    echo
}

# Função para alterar velocidade da interface de rede
change_speed() {
    echo "Interfaces de rede disponíveis:"
    echo
    select interface in $(ls /sys/class/net); do
        read -p "Digite a velocidade desejada (exemplo: 1000 for 1Gbps): " speed
        ethtool -s $interface speed $speed
        echo "Velocidade da interface $interface alterada para $speed Mbps."
        break
    done
}

# Função para habilitar ou desabilitar Wake-on-LAN
toggle_wol() {
    echo "Interfaces de rede disponíveis:"
    echo
    select interface in $(ls /sys/class/net); do
        read -p "Deseja habilitar ou desabilitar Wake-on-LAN? (on/off): " choice
        ethtool -s $interface wol $choice
        echo "Wake-on-LAN da interface $interface foi $choice."
        break
    done
}

# Função para exibir estatísticas de erros da interface
show_error_stats() {
    echo "Interfaces de rede disponíveis:"
    echo
    select interface in $(ls /sys/class/net); do
        ethtool -S $interface | grep -i 'err\|fail\|drop'
        break
    done
}

# Loop principal do script
while true; do
    show_menu
    read -p "Escolha uma opção: " choice

    case $choice in
        1) show_interface_info ;;
        2) change_speed ;;
        3) toggle_wol ;;
        4) show_error_stats ;;
        5) echo "Saindo..."; break ;;
        *) echo "Opção inválida. Tente novamente." ;;
    esac

    read -p "Pressione Enter para continuar..."
done

