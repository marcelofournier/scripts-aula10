#!/bin/bash
linha() {
    echo "------------------------------------------------------------------"
}
while true; do
    clear
    figlet "shutdown"
    linha
    echo "Opções para desligamento e reinicialização:"
    linha
    echo "1. Desligar o computador agora"
    echo "2. Desligar o computador em x minutos"
    echo "3. Reiniciar o computador agora"
    echo "4. Reiniciar o computador em x minutos"
    echo "0. Sair"
    linha
    read -p "Selecione a opção desejada: " opcao

    case $opcao in
        0)
            break
            ;;
        1)
            sudo shutdown -h now  # Desligar imediatamente
            ;;
        2)
            echo "Digite o número de minutos para desligar:"
            read minutos
            sudo shutdown -h +$minutos  # Desligar em x minutos
            ;;
        3)
            sudo shutdown -r now  # Reiniciar imediatamente
            ;;
        4)
            echo "Digite o número de minutos para reiniciar:"
            read minutos
            sudo shutdown -r +$minutos  # Reiniciar em x minutos
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac
done
