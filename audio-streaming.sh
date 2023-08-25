#!/bin/bash
linha() {
  echo "---------------------------------------------------------------------------------------"
}

aguarde() {
   echo
   read -p "Pressione qualquer tecla para continuar..."
   echo
}


clear


# Função para iniciar o streaming de áudio
start_streaming() {
    echo "Iniciando streaming de áudio no servidor..."
    read -p "Informe a porta para transmitir o áudio: " porta
    #cvlc -vvv musica.mp3 --sout '#standard{access=http,mux=ogg,dst=:5001}' --loop
    cvlc -vvv musica.mp3 --sout '#standard{access=http,mux=ogg,dst=:"porta"}' --loop    
    aguarde
}

# Função para parar o streaming de áudio
stop_streaming() {
    echo "Parando streaming de áudio..."
    pkill -f "cvlc http://192.168.15.68:5001"  # Substitua pelo seu endereço e porta
    aguarde
}

# Função para conectar ao streaming de áudio como cliente
connect_streaming() {
    echo "Conectar ao streaming de áudio como cliente..."
    #read -p "Informe o IP e a porta do servidor de streaming (exemplo: 192.168.15.10:5000): " servidor
    #read -p "Informe a porta utilizada na transmissão: " porta
    sudo apt install vlc
    #while true; do cvlc http://192.168.15.68:5001; done
    #while true; do cvlc http://$servidor; done
    cvlc http://192.168.15.68:5001  # Substitua pelo seu endereço e porta
    aguarde
}

# Loop do menu
while true; do
    clear
    figlet "streaming"
    linha
    echo "O áudio streaming é uma forma de gerar algum tráfego constante na rede"
    echo "Isso nos permite visualizar e estudar este tráfego em conjunto com outros"
    echo
    echo "Para testar esse ferramenta você precisará de um pc servidor e 1 cliente."
    echo "No pc servidor abra o script e execute o modo servidor."
    echo "No pc cliente faça o mesmo, para o modo cliente. Informe a mesma porta usada no servidor."
    echo "Não esqueça de habilitar no servidor a porta no firewall caso exista"
    echo
    echo "Mantenha um arquivo de música chamado musica.mp3 no mesmo diretório do script."
    echo
    echo "Menu de opções: streaming de áudio - cliente e servidor"
    linha
    echo "1. Iniciar streaming de áudio"
    echo "2. Parar streaming de áudio"
    echo "3. Conectar ao streaming de áudio cliente"
    echo "0. Sair"
    read -p "Escolha uma opção: " choice

    case $choice in
        1) start_streaming ;;
        2) stop_streaming ;;
        3) connect_streaming ;;
        0) exit ;;
        *) echo "Opção inválida";;
    esac

    echo
done
