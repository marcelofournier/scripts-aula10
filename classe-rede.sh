#!/bin/bash

# Obtém o endereço IP local
endereco_ip=$(hostname -I | awk '{print $1}')

# Função para determinar a classe do endereço IP
determinar_classe() {
    primeiro_octeto=$(echo "$1" | cut -d. -f1)

    if [ "$primeiro_octeto" -ge 1 ] && [ "$primeiro_octeto" -lt 128 ]; then
        echo "Classe A"
    elif [ "$primeiro_octeto" -ge 128 ] && [ "$primeiro_octeto" -lt 192 ]; then
        echo "Classe B"
    elif [ "$primeiro_octeto" -ge 192 ] && [ "$primeiro_octeto" -lt 224 ]; then
        echo "Classe C"
    else
        echo "Classe desconhecida"
    fi
}

# Determina e exibe a classe do endereço IP
echo "Endereço IP local: $endereco_ip"
echo "Classe do endereço IP: $(determinar_classe "$endereco_ip")"
