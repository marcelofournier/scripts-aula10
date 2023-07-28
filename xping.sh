#!/bin/bash

# Função para exibir o menu de opções
exibir_menu() {
    echo "----- Menu Ping -----"
    echo "1. Ping simples"
    echo "2. Definir número de pacotes"
    echo "3. Definir intervalo entre pacotes"
    echo "4. Resolver nomes DNS"
    echo "5. Sair"
    echo "---------------------"
}

# Função para realizar o ping com as opções selecionadas
executar_ping() {
    
    case $opcao in
        1)
            echo -n "Digite o endereço IP ou nome do host: "
            read endereco
            ping $endereco
            ;;
        2)
            echo -n "Digite o número de pacotes a serem enviados: "
            read num_pacotes
            ping -c $num_pacotes $endereco
            ;;
        3)
            echo -n "Digite o intervalo entre os pacotes em segundos: "
            read intervalo
            ping -i $intervalo $endereco
            ;;
        4)
            ping -n $endereco
            ;;
        5)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida"
            ;;
    esac
}

# Loop do menu
while true; do
    exibir_menu

    echo -n "Digite o número da opção desejada: "
    read opcao

    case $opcao in
        1|2|3|4|5)
            executar_ping
            ;;
        *)
            echo "Opção inválida"
            ;;
    esac

    echo # Linha em branco para melhorar a visualização
done
