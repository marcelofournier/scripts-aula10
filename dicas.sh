#!/bin/bash

# Obtém o caminho absoluto do diretório atual
diretorio=$(pwd)

function aguarde() {
  echo
  read -p "Pressione qualquer tecla para continuar..." tecla
  echo
}

# Pesquisa todos os arquivos .txt no diretório e armazena em um array
arquivos_txt=($(find "$diretorio" -maxdepth 1 -type f -name "*.txt"))

# Verifica se existem arquivos .txt no diretório
if [ ${#arquivos_txt[@]} -eq 0 ]; then
  echo "Nenhum arquivo .txt encontrado no diretório atual."
  exit 1
fi

# Mostra o menu de opções para o usuário
clear
figlet documentacao
echo
echo "Escolha o arquivo .txt para abrir:"
for ((i=0; i<${#arquivos_txt[@]}; i++)); do
  echo "$((i+1)). $(basename "${arquivos_txt[i]}")"
done

# Solicita a escolha ao usuário
read -p "Opção: " escolha

# Verifica se a escolha é válida
if [[ "$escolha" =~ ^[0-9]+$ && "$escolha" -ge 1 && "$escolha" -le ${#arquivos_txt[@]} ]]; then
  arquivo_escolhido="${arquivos_txt[escolha-1]}"
  # Abre o arquivo com o editor de texto (neste caso, usamos o nano)
  clear
  cat "$arquivo_escolhido" | more
  echo
  aguarde

else
  echo "Opção inválida."
fi

