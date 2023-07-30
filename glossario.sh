#!/bin/bash

GLOSSARY_FILE="glossario.txt"

# Função para exibir o menu
function show_menu() {
    clear
    figlet glossario
    arquivo="glossario.txt"
    termos=`wc -l < "$arquivo"`
    echo "Com $termos termos técnicos sobre redes e linux"
    echo
    echo "===== MENU ====="
    echo "1. Incluir um termo e descrição"
    echo "2. Pesquisar termo"
    echo "3. Ordenar glossário"
    echo "0. Sair"
    echo "================"
}

aguarde() {
   echo
   read -p "Pressione qualquer tecla para continuar..." tecla
   echo

}

# Função para incluir um termo e descrição no glossário
function add_term() {
    echo "Digite o termo:"
    read term

    echo "Digite a descrição:"
    read description

    echo "$term:$description" >> "$GLOSSARY_FILE"
    echo "Termo e descrição adicionados ao glossário."
    aguarde
}

# Função para pesquisar um termo no glossário
function search_term() {
    read -p "Digite o termo que deseja pesquisar:" search_term
    grep -i "^$search_term:" "$GLOSSARY_FILE"
    #cat "$GLOSSARY_FILE" | grep "^$search_term:"
    aguarde

}

# Função para ordenar o glossário
function sort_glossary() {
    sort -t':' -k1,1 -o "$GLOSSARY_FILE" "$GLOSSARY_FILE"
    echo "Glossário ordenado."
    wc -l "$GLOSSARY_FILE"
    aguarde
}

# Main loop
while true; do
    show_menu
    read -p "Digite o número da opção desejada: " option

    case "$option" in
        1)
            add_term
            ;;
        2)
            search_term
            ;;
        3)
            sort_glossary
            ;;
        0)  break
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac

    echo ""
done
