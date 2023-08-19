#!/bin/bash

linha() {
    echo "------------------------------------------------------------------"
}

while true; do
    clear
    figlet "gerar trafego"
    linha
    echo "Gerando tráfego na rede entre 2 hosts"
    linha
    echo "Escolha uma opção:"
    echo "1. Gerar arquivo para transmitir (usando dd)"
    echo "2. Entrar em modo para receber arquivo"
    echo "3. Transmitir arquivo"
    echo "0. Sair"
    linha
    read -p "Selecione a opção desejada: " opcao

    case $opcao in
        0)
            break
            ;;
        1)
            echo "Digite o nome do arquivo a ser gerado:"
            read arquivo
            echo "Digite o tamanho do arquivo (em MB):"
            read tamanho

            dd if=/dev/zero of=$arquivo bs=1M count=$tamanho
            echo "Arquivo gerado: $arquivo"
            aguarde
            ;;
        2)
            echo "Digite a porta para receber o arquivo:"
            read porta
            echo "Aguardando conexão na porta $porta..."
            ncat -l -p $porta > recebido
            echo "Arquivo recebido."
            aguarde
            ;;
        3)
            echo "Digite o endereço IP do destino:"
            read ip_destino
            echo "Digite a porta do destino:"
            read porta_destino
            echo "Digite o caminho completo do arquivo a ser transmitido:"
            read arquivo_origem

            ncat $ip_destino $porta_destino < $arquivo_origem
            echo "Arquivo transmitido para $ip_destino:$porta_destino."
            aguarde
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac
done
