#!/bin/bash

# Função para a preparar a tela para reiniciar a calculadora
function aguarde() {
  echo
  read -p "Pressione qualquer tecla para continuar... " tecla
}

function query_a_record() {
    read -p "Digite o nome de domínio para consultar o registro A: " domain
    dig $domain A
    echo
    aguarde
}

function query_mx_records() {
    echo
    read -p "Digite o nome de domínio para consultar os registros MX: " domain
    dig $domain MX
    echo
    aguarde
}

function query_txt_records() {
    echo
    read -p "Digite o nome de domínio para consultar os registros TXT: " domain
    dig $domain TXT
    echo
    aguarde
}

function query_ptr_record() {
    echo
    read -p "Digite o endereço IP para consultar o registro PTR: " ip_address
    dig -x $ip_address
    echo
    aguarde
}

function display_menu() {
    clear
    figlet dig
    echo
    echo "===== Menu de Opções ====="
    echo "1. Consultar registro A"
    echo "2. Consultar registros MX"
    echo "3. Consultar registros TXT"
    echo "4. Consultar registro PTR"
    echo "0. Sair"
    echo "=========================="
}

while true; do
    display_menu

    read -p "Digite o número da opção desejada: " choice

    case $choice in
        1)
            query_a_record
            ;;
        2)
            query_mx_records
            ;;
        3)
            query_txt_records
            ;;
        4)
            query_ptr_record
            ;;
        0)
            break;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac

    read -p "Pressione Enter para continuar..."
done

