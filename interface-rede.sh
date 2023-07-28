#!/bin/bash
clear
# Verificar se o usuário é root (ou tem privilégios de sudo)
if [[ $EUID -ne 0 ]]; then
  echo "Este script precisa ser executado como root (ou com privilégios de sudo)."
  exit 1
fi

echo "-----------------------------------"
echo "Status da Conexão de Rede:"
echo "-----------------------------------"
ping -c 3 www.google.com > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "Conexão de rede está ativa."
else
  echo "Não foi possível alcançar www.google.com. Verifique sua conexão de rede."
fi

echo "-----------------------------------"
echo "Interfaces de Rede Disponíveis:"
echo "-----------------------------------"
ip link show
echo ""

# Obter a interface de rede do usuário
read -p "Digite o nome da interface de rede que deseja testar (ex: eth0): " interface

# Verificar a conectividade para um endereço IP específico
read -p "Digite um endereço IP para testar a conectividade (ex: 8.8.8.8): " ip_address

echo "-----------------------------------"
echo "Teste de Conectividade para $ip_address:"
echo "-----------------------------------"
ping -c 5 $ip_address

if [ $? -eq 0 ]; then
  echo "Conexão bem-sucedida para $ip_address."
else
  echo "Não foi possível alcançar $ip_address. Verifique sua configuração de rede."
fi

echo Fim de processamento

