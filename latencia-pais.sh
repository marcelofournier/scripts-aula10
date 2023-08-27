#!/bin/bash

aguarde() {
    echo
    read -p "Pressione qualquer tecla para continuar..."
    echo
}

linha() {
    echo "--------------------------------------------------------------------------"
}

# Função para executar um teste de ping
ping_site() {
    clear
    echo "Executando um teste de ping no site de $1..."
    linha
    echo "Observe que o teste fará um ping especial 50x. Aguarde sua conclusão."
    echo "O teste ainda não começou. Comecará ao você pressionar uma tecla."
    host "$1"
    aguarde
    ping -i 0.1 -c 50 "$1"
    linha
    echo "Observe e anote os resultados para uma análise..."
    linha
    cat ping-dicas.txt | more
    aguarde
}


# Loop principal do programa
while true; do
    clear  # Limpa a tela
    figlet "Latencia WAN"
    linha

    # Exibe o menu de opções
    echo "Selecione um país para executar um teste de latência:"
    linha
    echo "  ÁFRICA               AMÉRICA                  EUROPA"
    linha
    echo "1. Egito              11. Estados Unidos      21. França"
    echo "2. África do Sul      12. Canadá              22. Alemanha"
    echo "3. Nigéria            13. México              23. Reino Unido"
    echo "4. Quênia             14. Cuba                24. Itália"
    echo "5. Marrocos           15. Jamaica             25. Espanha"
    linha
    echo "  ÁSIA                 AMÉRICA DO SUL           OCEANIA"
    linha
    echo "6. China              16. Brasil              26. Austrália"
    echo "7. Índia              17. Argentina           27. Nova Zelândia"
    echo "8. Rússia             18. Colômbia            28. Papua-Nova Guiné"
    echo "9. Japão              19. Chile               29. Fiji"
    echo "10. Arábia Saudita    20. Peru                30. Ilhas Salomão"
    linha
    echo ""
    echo "0. Sair"
    linha

    # Solicita ao usuário que escolha uma opção
    read -p "Digite o número da opção desejada [0 para sair]: " choice

    case $choice in
        0)
            echo "Saindo do programa."
            exit 0
            ;;
        1)  echo "ping no Egito: "
            linha
            ping_site "egypt.travel"
            aguarde;;
        2)  echo "Ping na Africa do Sul:"
            linha
            ping_site "www.gov.za"
            aguarde
            ;;
        3)  echo "Ping na Nigéria:"
            linha
            ping_site www.nigeria.gov.ng
            aguarde
            ;;
        4)  
            ping_site "www.kenya.go.ke"
            ;;
        5)
            ping_site "www.maroc.ma/en"
            ;;
        6)
            ping_site "www.gov.cn/english"
            ;;
        7)
            ping_site "www.india.gov.in"
            ;;
        8)
            ping_site "www.gov.ru/en"
            ;;
        9)
            ping_site "www.japan.go.jp"
            ;;
        10)
            ping_site "www.saudi.gov.sa"
            ;;
        11)
            ping_site "www.usa.gov"
            ;;
        12)
            ping_site "www.canada.ca"
            ;;
        13)
            ping_site "www.gob.mx"
            ;;
        14)
            ping_site "www.cubagob.cu"
            ;;
        15)
            ping_site "www.jis.gov.jm"
            ;;
        16)
            ping_site "www.gov.br"
            ;;
        17)
            ping_site "www.argentina.gob.ar"
            ;;
        18)
            ping_site "www.colombia.co"
            ;;
        19)
            ping_site "www.gob.cl"
            ;;
        20)
            ping_site "www.gob.pe"
            ;;
        21)
            ping_site "www.gouvernement.fr"
            ;;
        22)
            ping_site "www.deutschland.de"
            ;;
        23)
            ping_site "www.gov.uk"
            ;;
        24)
            ping_site "www.italia.it"
            ;;
        25)
            ping_site "www.lamoncloa.gob.es"
            ;;
        26)
            ping_site "www.australia.gov.au"
            ;;
        27)
            ping_site "www.govt.nz"
            ;;
        28)
            ping_site "www.pngbd.com"
            ;;
        29)
            ping_site "www.fiji.gov.fj"
            ;;
        30)
            ping_site "www.pmc.gov.sb"
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac

    # Aguarda um prompt antes de continuar
    read -p "Pressione Enter para continuar..."
done
