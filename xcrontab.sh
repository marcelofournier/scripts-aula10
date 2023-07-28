#!/bin/bash

aguarde(){
   echo
   read -p "Pressione uma tecla para continuar..."
}

# Função para exibir o menu
show_menu() {
    echo "----------------------------------------"
    echo "           Gerenciador de Crontab"
    echo "----------------------------------------"
    echo "1. Visualizar o Crontab atual"
    echo "2. Editar o Crontab atual"
    echo "3. Remover o Crontab atual"
    echo "0. Sair"
    echo "----------------------------------------"
}

# Função para visualizar o Crontab atual
view_crontab() {
    crontab -l
    aguarde
}

# Função para editar o Crontab atual
edit_crontab() {
    crontab -e
    aguarde
}

# Função para remover o Crontab atual
remove_crontab() {
    crontab -r
    aguarde
}

# Loop principal do menu
while true; do

    clear
    figlet crontab
    show_menu

    read -p "Escolha uma opção: " option
    case $option in
        1)
            view_crontab
            ;;
        2)
            edit_crontab
            ;;
        3)
            remove_crontab
            ;;
        0)
            echo "Saindo..."
            break
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac

    echo
done
