#!/bin/bash

# Número de processos 'yes' a serem executados em paralelo
NUM_PROCESSOS=4

# Caractere para a saída do comando 'yes'
CARACTERE="y"

# Função para gerar carga de CPU em um único núcleo
gerar_carga() {
  while : ; do
    yes "$CARACTERE" >/dev/null
  done
}

# Inicializar os processos para gerar carga
for ((i = 0; i < NUM_PROCESSOS; i++)); do
  gerar_carga &
done

# Aguardar até que o script seja interrompido
trap "killall yes" EXIT
wait

