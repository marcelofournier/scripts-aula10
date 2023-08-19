#!/bin/bash
linha() {
    echo "------------------------------------------------------------------"
}
aguarde(){
    echo
    linha
    read -p "Pressione qualquer tecla para continuar..."
    echo
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
    echo "5. Cancelar o desligamento já programado"
    echo "0. Sair"
    linha
    read -p "Selecione a opção desejada: " opcao

    case $opcao in
        0)
            break
            ;;
        1)
            sudo shutdown -h now  # Desligar imediatamente
            aguarde;;
        2)
            read -p "Digite o número de minutos para desligar:" minutos
            sudo shutdown -h +$minutos  # Desligar em x minutos
            aguarde;;
        3)
            sudo shutdown -r now  # Reiniciar imediatamente
            aguarde
            ;;
        4)
            read -p "Digite o número de minutos para reiniciar:" minutos
            sudo shutdown -r +$minutos  # Reiniciar em x minutos
            aguarde
            ;;
        5)  sudo shutdown -c
            aguarde
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac
done
