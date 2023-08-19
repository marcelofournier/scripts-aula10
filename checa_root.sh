#!/bin/bash

# Verifica se o usuário é o root
if [ $(id -u) -eq 0 ]; then
    echo "Você é o root."
else
    echo "Você não é o root."
fi

