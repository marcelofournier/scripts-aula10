#!/bin/bash

# Função para exibir o menu de opções
exibir_menu() {
    clear
    figlet servicos
    echo
    echo "----- Menu de Gestão de Serviços -----"
    echo "1. Iniciar um serviço"
    echo "2. Parar um serviço"
    echo "3. Reiniciar um serviço"
    echo "4. Verificar status de um serviço"
    echo "5. Habilitar serviço na inicialização do host"
    echo "6. Desabilitar serviço na inicialização do host"
    echo "7. Listar serviços instalados (ativos ou não) no host"
    echo "8. Listar serviços em execução"
    echo "9. Parar e desinstalar completamente um serviço"
    echo "0. Sair"
    echo "--------------------------------------"
}

aguarde(){
  echo
  read -p "Pressione uma tecla para continuar..." tecla
}

listar_servicos_instalados() {
   echo
   sudo systemctl list-unit-files --type=service
   echo
   aguarde
}

listar_servicos_execucao() {
   echo
   sudo systemctl list-units --type=service --state=running
   echo
   aguarde
}

habilitar_servico() {
    echo -n "Digite o nome do serviço que deseja habilitar na inicialização: "
    read servico
    sudo systemctl enable $servico
    aguarde
}

desabilitar_servico() {
    echo -n "Digite o nome do serviço que deseja desabilitar na inicialização: "
    read servico
    sudo systemctl disable $servico
    aguarde
}

remover_servico() {
    echo -n "Digite o nome do serviço que deseja desinstalar: "
    read servico
    sudo systemctl stop $servico
    aguarde
    sudo systemctl disable nome_do_serviço
    aguarde
    sudo apt purge nome_do_serviço
    echo
    aguarde
}

# Função para iniciar um serviço
iniciar_servico() {
    echo -n "Digite o nome do serviço que deseja iniciar: "
    read servico
    sudo systemctl start $servico
    aguarde
}

# Função para parar um serviço
parar_servico() {
    echo -n "Digite o nome do serviço que deseja parar: "
    read servico
    sudo systemctl stop $servico
    aguarde
}

# Função para reiniciar um serviço
reiniciar_servico() {
    echo -n "Digite o nome do serviço que deseja reiniciar: "
    read servico
    sudo systemctl restart $servico
    aguarde
}

# Função para verificar o status de um serviço
verificar_status_servico() {
    echo -n "Digite o nome do serviço que deseja verificar o status: "
    read servico
    sudo systemctl status $servico
    aguarde
}

# Loop do menu
while true; do
    exibir_menu

    echo -n "Digite o número da opção desejada: "
    read opcao

    case $opcao in
        1)
            iniciar_servico
            ;;
        2)
            parar_servico
            ;;
        3)
            reiniciar_servico
            ;;
        4)
            verificar_status_servico
            ;;
        5)  habilitar_servico;;
        6)  desabilitar_servico;;
        7)  listar_servicos_instalados;;
        8)  listar_servicos_execucao;;
        9)  remover_servico;;
        0)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida"
            ;;
    esac

    echo # Linha em branco para melhorar a visualização
done
