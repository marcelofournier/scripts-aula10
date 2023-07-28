#!/bin/bash

# Função para exibir o menu
show_menu() {
    echo "--------------------------------------"
    echo "           Gerenciador de Logs"
    echo "--------------------------------------"
    echo "1. Visualizar log do sistema"
    echo "2. Limpar log do sistema"
    echo "3. Filtrar log por termo/palavra"
    echo "4. Monitorar em tempo real o log do sistema"
    echo "0. Sair"
    echo "--------------------------------------"
}

monitorar_log() {
   clear
   echo
   sudo tail -f /var/log/syslog
   echo
   aguarde
}

filtrar_log(){
    echo
    read -p "Informe a palavra desejada para pesquisa no log: " opcao
    cat /var/log/syslog | grep $opcao
    echo
    aguarde
}

# Função para visualizar o log do sistema
view_system_log() {
    cat /var/log/syslog
    echo
    aguarde

}

# Função para limpar o log do sistema
clear_system_log() {
    sudo truncate -s 0 /var/log/syslog
    echo
    echo "Log do sistema foi limpo."
    aguarde
}

function aguarde() {
  echo
  read -p "Pressione qualquer tecla para continuar... " tecla
}

# Loop principal do menu
while true; do
    clear
    figlet log do sistema
    echo
    show_menu

    read -p "Escolha uma opção: " option
    case $option in
        1)  view_system_log
            ;;
        2)
            clear_system_log
            ;;
        3)  filtrar_log;;
        4)  monitorar_log;; 
        0) exit 0;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac

    echo
done
