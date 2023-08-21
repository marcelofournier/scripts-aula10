#!/bin/bash

linha() {
echo "--------------------------------------------------------------------------"
}
aguarde() {
	read -p "Pressione qualquer tecla para continuar..." tecla
}

clear
figlet "install..."
echo "Este script irá instalar alguns pacotes necessários..."
linha

# Verifica se o script é executado como root
if [[ $EUID -ne 0 ]]; then
	linha
   echo "Este script deve ser executado como root."
   exit 1
fi

# Nome do arquivo contendo a lista de pacotes
lista_pacotes="pacotes-instalar.txt"

# Verifica se o arquivo de lista de pacotes existe
if [ ! -f "$lista_pacotes" ]; then
    echo "Arquivo $lista_pacotes não encontrado."
    exit 1
fi

# Lê cada linha do arquivo e instala os pacotes
while read -r pacote; do
    if [ -n "$pacote" ]; then
        echo "Instalando $pacote..."
        apt install -y "$pacote"
        if [ $? -eq 0 ]; then
            echo "Instalação de $pacote concluída."
        else
            echo "Erro ao instalar $pacote."
        fi
    fi
done < "$lista_pacotes"

echo "Instalação de pacotes concluída."
echo
linha
aguarde

