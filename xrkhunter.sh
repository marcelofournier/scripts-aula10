#!/bin/bash

while true; do
    clear
    figlet "vulnerabilidades"
    echo "---------------------------------------------------------------"
    ls -lh /var/log/rkhunter.log 
    du -h  /var/log/rkhunter.log
    echo "---------------------------------------------------------------"
    echo "Menu de Opções - rkhunter"
    echo "1. Instalar o rkhunter"
    echo "2. Atualizar Bancos de Dados"
    echo "3. Executar Verificação"
    echo "4. Visualizar log de verificação completo"
    echo "5. Visualizar log de verificação com warnings"
    echo "6. Apagar log de verificação"
    echo "0. Sair"
    read -p "Escolha uma opção: " choice

    case $choice in
        1) sudo apt install rkhunter;;
        
        2)
            sudo rkhunter --update
            echo "Bancos de Dados Atualizados."
            ;;
        3)
            sudo rkhunter -c --sk
            ;;
        4) sudo cat /var/log/rkhunter.log | more;;
        5) sudo cat /var/log/rkhunter.log | grep "warning" | more;;
        6) sudo rm  /var/log/rkhunter.log;;
        0) exit 0;;
        *) echo "Opção inválida. Por favor, escolha uma opção válida."
            ;;
    esac

    read -p "Pressione Enter para continuar..."
done
