#!/bin/bash
linha() {
    echo "------------------------------------------------------------------"
}
# Função para exibir o menu de opções
exibir_menu() {
    clear
    figlet grupos
    linha
    echo " Menu de Administração de Grupos"
    linha
    echo "1. Adicionar grupo"
    echo "2. Remover grupo"
    echo "3. Listar grupos"
    echo "4. Adicionar usuário a um grupo"
    echo "5. Remover usuário de um grupo"
    echo "6. Visualizar os grupos de um usuário"
    echo "7. Visualizar os usuários de um grupo"
    echo "0. Sair"
    linha
}

function aguarde() {
   echo
   read -p "Pressione qualquer tecla para continuar..." tecla
   
}

# Função para adicionar um novo grupo
adicionar_grupo() {
    echo -n "Digite o nome do novo grupo: "
    read novo_grupo
    sudo groupadd $novo_grupo
    aguarde
}

# Função para remover um grupo
remover_grupo() {
    echo -n "Digite o nome do grupo a ser removido: "
    read grupo_remover
    sudo groupdel $grupo_remover
    aguarde
}

# Função para listar todos os grupos
listar_grupos() {
    echo "Lista de grupos:"
    cut -d: -f1 /etc/group
    aguarde
}

# Função para adicionar um usuário a um grupo
adicionar_usuario_grupo() {
    echo -n "Digite o nome do usuário: "
    read usuario
    echo -n "Digite o nome do grupo: "
    read grupo
    sudo usermod -aG $grupo $usuario
    aguarde
}

# Função para remover um usuário de um grupo
remover_usuario_grupo() {
    echo -n "Digite o nome do usuário: "
    read usuario
    echo -n "Digite o nome do grupo: "
    read grupo
    sudo gpasswd -d $usuario $grupo
    aguarde
}

usuarios_grupo(){
    echo
    read -p "Informe o nome do grupo: " opcao
    getent group $opcao
    echo
    aguarde
}

grupos_usuario() {
    echo
    read -p "Informe o nome do usuário: " opcao
    groups $opcao
    aguarde
}

# Loop do menu
while true; do
    exibir_menu

    echo -n "Digite o número da opção desejada: "
    read opcao

    case $opcao in
        1) adicionar_grupo;;
        2) remover_grupo;;
        3) listar_grupos;;
        4) adicionar_usuario_grupo;;
        5) remover_usuario_grupo;;
        6) grupos_usuario;;
        7) usuarios_grupo;;
        0) exit 0;;
        *)
            echo "Opção inválida"
            ;;
    esac

    echo # Linha em branco para melhorar a visualização
done

