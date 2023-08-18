#!/bin/bash

while true; do
    clear
    figlet "Antivirus linux"
    echo
    echo "Menu de Opções - ClamAV"
    echo "1. Instalar o Antivírus"
    echo "2. Habilitar o Daemon"
    echo "3. Desabilitar o Daemon"
    echo "4. Analisar Arquivo"
    echo "5. Analisar Diretório"
    echo "0. Sair"
    read -p "Escolha uma opção: " choice

    case $choice in
        1)
            sudo apt-get update
            sudo apt-get install clamav
            ;;
        2)
            sudo systemctl start clamav-daemon
            sudo systemctl enable clamav-daemon
            echo "Daemon habilitado e em execução."
            ;;
        3)
            sudo systemctl stop clamav-daemon
            sudo systemctl disable clamav-daemon
            echo "Daemon desabilitado."
            ;;
        4)
            read -p "Digite o caminho completo para o arquivo a ser analisado: " file_path
            sudo clamscan "$file_path"
            ;;
        5)
            read -p "Digite o caminho completo para o diretório a ser analisado: " dir_path
            sudo clamscan -r "$dir_path"
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
#!/bin/bash

while true; do
    clear
    echo "Menu de Opções - ClamAV"
    echo "1. Instalar o Antivírus"
    echo "2. Habilitar o Daemon"
    echo "3. Desabilitar o Daemon"
    echo "4. Analisar Arquivo"
    echo "5. Analisar Diretório"
    echo "0. Sair"
    read -p "Escolha uma opção: " choice

    case $choice in
        1)
            sudo apt-get update
            sudo apt-get install clamav
            ;;
        2)
            sudo systemctl start clamav-daemon
            sudo systemctl enable clamav-daemon
            echo "Daemon habilitado e em execução."
            ;;
        3)
            sudo systemctl stop clamav-daemon
            sudo systemctl disable clamav-daemon
            echo "Daemon desabilitado."
            ;;
        4)
            read -p "Digite o caminho completo para o arquivo a ser analisado: " file_path
            sudo clamscan "$file_path"
            ;;
        5)
            read -p "Digite o caminho completo para o diretório a ser analisado: " dir_path
            sudo clamscan -r "$dir_path"
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
