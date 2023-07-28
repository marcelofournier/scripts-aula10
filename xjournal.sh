#!/bin/bash

# Função para exibir o menu
show_menu() {
    clear
    figlet journal
    echo
    echo "-----------------------------------------"
    echo "       Gerenciador de Registros"
    echo "-----------------------------------------"
    echo "1. Visualizar todos os registros"
    echo "2. Visualizar registros de um serviço específico"
    echo "3. Visualizar registros do kernel"
    echo "4. Visualizar registros por período de tempo"
    echo "5. Filtrar registros por palavra-chave"
    echo "0. Sair"
    echo "-----------------------------------------"
}

function aguarde() {
  echo
  read -p "Pressione qualquer tecla para continuar... " tecla
}

# Função para visualizar todos os registros
view_all_logs() {
    journalctl
}

# Função para visualizar registros de um serviço específico
view_service_logs() {
    read -p "Digite o nome do serviço: " service_name
    journalctl -u $service_name
}

# Função para visualizar registros do kernel
view_kernel_logs() {
    journalctl -k
}

# Função para visualizar registros por período de tempo
view_logs_by_time() {
    read -p "Digite a data de início (exemplo: 2023-07-25): " start_date
    read -p "Digite a hora de início (exemplo: 00:00:00): " start_time
    read -p "Digite a data de término (exemplo: 2023-07-26): " end_date
    read -p "Digite a hora de término (exemplo: 23:59:59): " end_time

    journalctl --since "$start_date $start_time" --until "$end_date $end_time"
}

# Função para filtrar registros por palavra-chave
filter_logs_by_keyword() {
    read -p "Digite a palavra-chave que deseja pesquisar: " keyword
    journalctl | grep "$keyword"
}

# Loop principal do menu
while true; do
    show_menu

    read -p "Escolha uma opção: " option
    case $option in
        1)
            view_all_logs
            aguarde;;
        2)
            view_service_logs
            aguarde;;
        3)
            view_kernel_logs
            aguarde;;
        4)
            view_logs_by_time
            aguarde;;
        5)
            filter_logs_by_keyword
            aguarde
            ;;
        0)
            exit 0;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac

    echo
done
