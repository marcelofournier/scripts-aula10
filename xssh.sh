#!/bin/bash

linha() {
    echo "------------------------------------------------------------------"
}

while true; do
    clear
    figlet "ssh tools"
    echo
    linha
    echo "Menu de Opções - SSH tools"
    linha
    echo "1. Conectar via SSH"
    echo "2. Gerar Chaves SSH"
    echo "3. Copiar Chaves SSH para Outro Host"
    echo "4. Criptografar um Arquivo"
    echo "5. Descriptografar um Arquivo"
    echo "0. Sair"
    echo
    linha
    read -p "Escolha uma opção: " choice

    case $choice in
        1)
            read -p "Digite o nome de usuário@host para conectar via SSH: " ssh_target
            read -p "Informe a porta ssh para conexão: " porta
            ssh -p "$porta" "$ssh_target"
            ;;
        2)
            ssh-keygen
            ;;
        3)
            read -p "Digite o nome de usuário@host para copiar as chaves: " ssh_target
            read -p "Informe a porta ssh para conexão: " porta
            ssh-copy-id -p "$porta" "$ssh_target"
            ;;
        4)
            read -p "Digite o caminho completo para o arquivo a ser criptografado: " input_file
            read -p "Digite o nome do arquivo de saída criptografado: " encrypted_file
            gpg -c "$input_file" -o "$encrypted_file"
            ;;
        5)
            read -p "Digite o caminho completo para o arquivo criptografado: " encrypted_file
            read -p "Digite o nome do arquivo de saída descriptografado: " decrypted_file
            gpg -d "$encrypted_file" -o "$decrypted_file"
            ;;
        0)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida. Por favor, escolha uma opção válida."
            ;;
    esac

    read -p "Pressione Enter para continuar..."
done
