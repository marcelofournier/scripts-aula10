#!/bin/bash
clear

# Função para a preparar a tela para reiniciar a calculadora
function aguarde() {
  echo
  read -p "Pressione qualquer tecla para continuar... " tecla
}

function query_mx_records() {
    echo
    read -p "Digite o nome de domínio para consultar os registros MX: " domain
    dig $domain MX
    echo
    aguarde
}

atualizar_pacotes() {
    sudo apt update
    sudo apt upgade -y
}

function display_menu() {
    clear
    figlet ambientes graficos
    echo
    echo "===== Menu de Opções ====="
    echo "1.  ubuntu-gnome-desktop"
    echo "2.  xubuntu-desktop"
    echo "3.  lubuntu-desktop"
    echo "4.  kubuntu-desktop"
    echo "5.  kde"
    echo "6.  mate-desktop-environment"
    echo "7.  elementary-desktop"
    echo "8.  blackbox"
    echo "9.  herbstluftwm"
    echo "10. awesome"
    echo "11. bspwm"
    echo "12. qtile"
    echo "13. icewm"
    echo "14. i3"
    echo "15. sway"
    echo "0. Sair"
    echo "========================================="
}


#1
function _ubuntu-gnome-desktop() {
    sudo apt install ubuntu-gnome-desktop -y
    aguarde
    }

#2
function _xubuntu-desktop() {
    sudo apt install xubuntu-desktop -y
    aguarde
    }

#3
function _Lubuntu-desktop() {
    sudo apt install Lubuntu-desktop -y
    aguarde
    }

#4
function _kubuntu-desktop() {
    sudo apt install kubuntu-desktop -y
    aguarde
    }
#5
function _mate-desktop-environment() {
    sudo apt install mate-desktop-environment -y
    aguarde
    }
#6
function _kde_full() {
    sudo apt install kde-full -y
    aguarde
    }

#7
function _elementary-os() {
    sudo add-apt-repository ppa:elementary-os/stable -y
    atualizar
    sudo apt install elementary-desktop -y
    aguarde
}

#8
_blackbox() {
    sudo apt install blackbox blackbox-themes -y
    aguarde
    }

#9 
function _herbstluftwm() {
    sudo apt install herbstluftwm -y
    aguarde
    }

#10
function _awesome() {
    sudo apt install awesome -y
    aguarde
    }

#11
#bspwm
function _bspwm() {
    sudo apt install bspwm sxhkd -y
    aguarde
    }

#12
#qtile
function _qtile() {
    sudo apt install python3-pip -y
    pip install xcffib pip install qtile -y
    aguarde
}

#13
function _icewm() {
    sudo apt install icewm -y
    aguarde
    }

#14
function _i3() {
    sudo apt install i3 -y
    aguarde
    }

#15
function _sway() {
    sudo apt install sway -y
    aguarde
    }

while true; do
    display_menu

    read -p "Digite o número da opção desejada: " choice

    case $choice in
        1) _ubuntu-gnome-desktop;;
        2) _xubuntu-desktop;;
        3) _lubuntu-desktop;;
        4) _kubuntu-desktop;;
        5) _kde-full;;
        6) _mate-desktop-environment;;
        7) _elementary-desktop;;
        8) _blackbox;;
        9) _herbstluftwm;;
        10) _awesome;;
        11) _bspwm;;
        12) _qtile;;
        13) _icewm;;
        14) _i3;;
        15) _sway;;
        0) break;;
        *) echo "Opção inválida. Tente novamente." ;;
    esac

    read -p "Pressione Enter para continuar..." tecla
done

