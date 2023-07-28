#!/bin/bash


# Função para realizar a soma
function soma() {
  read -p "Digite o primeiro número: " num1
  read -p "Digite o segundo número: " num2
  resultado=$((num1 + num2))
  echo "Resultado da soma: $resultado"
}

# Função para realizar a subtração
function subtracao() {
  read -p "Digite o primeiro número: " num1
  read -p "Digite o segundo número: " num2
  resultado=$((num1 - num2))
  echo "Resultado da subtração: $resultado"
}

# Função para realizar a multiplicação
function multiplicacao() {
  read -p "Digite o primeiro número: " num1
  read -p "Digite o segundo número: " num2
  resultado=$((num1 * num2))
  echo "Resultado da multiplicação: $resultado"
}

# Função para realizar a divisão
function divisao() {
  read -p "Digite o primeiro número: " num1
  read -p "Digite o segundo número: " num2

  # Verifica se o segundo número é zero para evitar divisão por zero
  if [ $num2 -eq 0 ]; then
    echo "Erro: Divisão por zero não é permitida."
  else
    resultado=$(echo "scale=2; $num1 / $num2" | bc)
    echo "Resultado da divisão: $resultado"
  fi
}

# Função para a preparar a tela para reiniciar a calculadora
function prepara() {
  echo
  echo "Pressione qualquer tecla para continuar"
  #read -t "Pressione qualquer tecla para continuar... " tecla
  read p
}

# Loop para apresentar o menu até que o usuário escolha a opção de sair
clear
figlet calculadora
echo
figlet de rede
echo
echo  "by: prof. marcelo fournier"
echo 
echo "##############################################################################"
echo

while true; do
  echo " ==== Calculadora ===="
  echo " 1. Soma"
  echo " 2. Subtração"
  echo " 3. Multiplicação"
  echo " 4. Divisão"
  echo " 5. Sair"
  read -p " Escolha uma opção (1-5): " opcao

  case $opcao in
    1)
      soma
      prepara
      ;;
    2)
      subtracao
      prepara
      ;;
    3)
      multiplicacao
      prepara
      ;;
    4)
      divisao
      prepara
      ;;
    5)
      echo "Saindo da calculadora."
      exit 0
      ;;
    *)
      echo "Opção inválida. Por favor, escolha uma opção válida (1-5)."
      ;;
  esac

  echo
done
