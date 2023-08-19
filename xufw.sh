#!/bin/bash
linha() {
    echo "------------------------------------------------------------------"
}
# Função para a preparar a tela para reiniciar a calculadora
function aguarde() {
  echo
  read -p "Pressione qualquer tecla para continuar... " tecla
}


# Verificar se o usuário é root (necessário para usar o UFW)
if [ "$EUID" -ne 0 ]; then
  echo "Este script precisa ser executado com privilégios de superusuário (root)."
  exit 1
fi

# Função para habilitar o UFW
enable_ufw() {
  clear
  sudo ufw enable
  echo
  aguarde
}

# Função para configurar as políticas padrão
configure_default_policies() {

  ufw default deny incoming
  ufw default allow outgoing
  echo "Políticas padrão configuradas: Negar tráfego de entrada e Permitir tráfego de saída."
}

# Função para abrir uma porta específica
allow_port() {
  clear
  echo
  read -p "Digite o número da porta que deseja permitir: " port_number
  ufw allow "$port_number"/tcp
  echo "Porta $port_number/tcp permitida."
  echo
  aguarde
}

# Função para fechar uma porta específica
deny_port() {
  clear
  echo
  read -p "Digite o número da porta que deseja bloquear: " port_number
  ufw deny "$port_number"/tcp
  echo "Porta $port_number/tcp bloqueada."
  echo
  aguarde
}

# Função para exibir as regras de firewall configuradas
show_status() {
  clear
  echo
  ufw status verbose
  echo
  aguarde
}

instalar() {
  echo
  echo "Instalar o ufw no host local."
  sudo apt install ufw
  echo
  aguarde
}
# Menu de opções
while true; do
  clear
  figlet firewall
  linha
  echo " Menu de opções - Gerenciamento do firewall"
  linha
  echo "1. Habilitar o UFW"
  echo "2. Configurar políticas padrão"
  echo "3. Permitir uma porta"
  echo "4. Bloquear uma porta"
  echo "5. Exibir status das regras"
  echo "6. Instalar o ufw firewall"
  echo "0. Sair"
  linha
  read -p "Digite o número da opção desejada: " option

  case $option in
    1) enable_ufw;;
    2) configure_default_policies;;
    3) allow_port;;
    4) deny_port;;
    5) show_status;;
    6) instalar;;
    0) exit 0;;
    *) echo "Opção inválida. Por favor, digite um número válido.";;
  esac

  echo
done

