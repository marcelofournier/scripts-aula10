#!/bin/bash

linha() {
    echo "------------------------------------------------------------------"
}

while true; do
    clear
    figlet "socket tcp/udp"
    linha
    echo "Menu de Opções - Socket Statistics"
    linha
    echo "1. Socket Estatísticas"
    echo "2. Visualizar Sockets TCP"
    echo "3. Visualizar Sockets UDP"
    echo "4. Visualizar Sockets Escutando"
    echo "5. Mostrar Todas as Conexões e Sockets"
    echo "6. Visualizar Sockets com Processos Associados"
    echo "0. Sair"
    linha
    read -p "Escolha uma opção: " choice

    case $choice in
        1)  clear
            linha
            echo "Socket estatísticas"
            linha
            ss -s
            ;;
        2)  clear
            linha
            echo "Visualizar Sockets TCP"
            linha
            ss -t
            ;;
        3)  clear
            linha
            echo "Visualizar Sockets UDP"
            linha
            ss -u
            ;;
        4)  clear
            linha
            echo "Visualizar Sockets Escutando"
            linha
            ss -t -l
            ;;
        5)  clear
            linha
            echo "Mostrar Todas as Conexões e Sockets"
            linha
            ss -a
            ;;
        6)  clear
            linha
            echo "Visualizar Sockets com Processos Associados"
            linha
            ss -t -p
            ;;
        0)  exit 0
            ;;
        *)
            echo "Opção inválida. Por favor, escolha uma opção válida."
            ;;
    esac

    read -p "Pressione Enter para continuar..."
done
