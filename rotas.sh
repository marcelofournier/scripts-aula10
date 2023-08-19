#!/bin/bash
linha() {
    echo "------------------------------------------------------------------"
}
aguarde() {
   echo
   read -p "Pressione qualquer tecla para continuar..." tecla
   echo
}

mostrar_tabela_roteamento() {
    echo "Tabela de Roteamento:"
    route -n
    aguarde
}

adicionar_nova_rota() {
    echo "Digite o destino da rota (exemplo: 192.168.1.0):"
    read destino

    echo "Digite o gateway para o destino (exemplo: 10.0.0.1):"
    read gateway

    echo "Digite a máscara de rede (exemplo: 255.255.255.0):"
    read mascara

    echo "Digite a interface de rede (exemplo: eth0):"
    read interface

    sudo route add -net $destino netmask $mascara gw $gateway dev $interface
    echo "Nova rota adicionada com sucesso!"
    aguarde
}

remover_rota() {
    read -p "Digite o endereço da rede (exemplo: 192.168.1.0):" rede
    
    read -p "Digite a interface de rede (exemplo: eth0):" interface

    sudo route del -net $rede dev $interface
    echo "Rota adicionada com sucesso!"
    echo $0
    aguarde
}

visualizar_rede() {
  echo
  ifconfig
  echo
  linha
  aguarde
}

add_gateway() {
    echo
    read -p "Informe o endereço IP do gateway (exemplo: 192.168.1.1):" gw
    ifconfig
    read -p "Informe o nome da interface de rede desejada (exemplo: eth0):" interface
    route add default gw $gw $interface
    aguarde
    route -n
    echo
    linha
    aguarde
}

# Loop do menu
while true; do
    clear
    figlet roteamento
    linha
    echo "Menu de Opções:"
    linha
    echo "1. Visualizar tabela de roteamento"
    echo "2. Visualizar interfaces de rede"
    echo "3. Adicionar rota"
    echo "4. Remover rota"
    echo "5. Adicionar gateway padrão (default gateway)"
    echo "0. Sair"
    linha
    read -p "Escolha uma opção: " opcao

    case $opcao in
        1)  mostrar_tabela_roteamento;;
        2)  visualizar_rede;;
        3)  adicionar_nova_rota;;
        4)  remover_rota;;
        5)  add_gateway;;
        0)  break;;
        *)  echo "Opção inválida! Tente novamente.";;
    esac
done
