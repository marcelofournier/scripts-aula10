#!/bin/bash

# Verificar se o usuário é root (necessário para usar o APT)
if [ "$EUID" -ne 0 ]; then
  echo "Este script precisa ser executado com privilégios de superusuário (root)."
  exit 1
fi

aguarde(){
   echo
   read -p "Pressione uma tecla para continuar..."
}

# Função para atualizar a lista de pacotes disponíveis
update_packages() {
  apt update
  aguarde
}

# Função para atualizar pacotes instalados
upgrade_packages() {
  apt upgrade -y
  aguarde
}

# Função para instalar um pacote
install_package() {
  read -p "Digite o nome do pacote que deseja instalar: " package_name
  apt install -y "$package_name"
  aguarde
}

# Função para remover um pacote
remove_package() {
  read -p "Digite o nome do pacote que deseja remover: " package_name
  apt remove -y "$package_name"
  aguarde
}

# Função para pesquisar um pacote
search_package() {
  read -p "Digite o termo que deseja pesquisar: " package_name
  apt-cache search a | grep "$package_name"
  aguarde
}

# Função para mostrar informações sobre um pacote
show_package_info() {
  read -p "Digite o nome do pacote que deseja verificar: " package_name
  apt show "$package_name"
  aguarde
}

# Função para remover e desinstalar pacotes obsoletos na máquina local
remover_pacotes() {
   echo
   sudo apt autoremove && sudo apt autoclean
   echo
   aguarde
}

# Menu de opções
while true; do
  clear
  figlet pacotes
  echo "======== MENU DE OPÇÕES ========"
  echo "1. Atualizar lista de pacotes disponíveis"
  echo "2. Atualizar pacotes instalados"
  echo "3. Instalar um pacote"
  echo "4. Remover um pacote"
  echo "5. Pesquisar um pacote"
  echo "6. Mostrar informações sobre um pacote"
  echo "7. Remover pacotes obsoletos"
  echo "0. Sair"
  read -p "Digite o número da opção desejada: " option

  case $option in
    1) update_packages;;
    2) upgrade_packages;;
    3) install_package;;
    4) remove_package;;
    5) search_package;;
    6) show_package_info;;
    7) remover_pacotes;;
    0) echo "Encerrando o script. Até mais!"; exit 0;;
    *) echo "Opção inválida. Por favor, digite um número válido.";;
  esac

  echo
done

