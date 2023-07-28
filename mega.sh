#!/bin/bash

apaga_arquivos()
{

    if [ -f "resultado.dat" ];
        then
           rm resultado.dat >> null
        fi

    rm ns*.dat >> null
    rm *.bil
}


#********************************
# Chama o resultado do processamento e mostra ao usuario
#********************************

mostra_resultado(){
    clear
    cat "$arquivo"
    tela
    echo "Atenção!"
    echo "Os bilhetes gerados podem ser conferidos no arquivo: bilhetes_gerados.dat"
    echo "Bilhete sugerido:"
    echo "     x |números a jogar"
    #tail -n 6 ns5.dat
    # mostra as 6 primeiras linhas do arquivo ns5.dat
    head -n 6 ns5.dat
    echo "************************************" >> bilhetes_gerados.dat
    echo "SIMULADOR DE MEGA-SENA" >> bilhetes_gerados.dat
    echo "RESULTADO: " >> bilhetes_gerados.dat
    echo "************************************" >> bilhetes_gerados.dat
    head -n 6 ns5.dat >> bilhetes_gerados.dat
}

tela(){
    clear
    echo
    echo "*************************************************************"
    echo
    figlet simulador
    figlet mega-sena
    echo "    by: "
    echo
    echo "*************************************************************"
    echo
}

inicializa()
{
    clear
    rm bilhetes_gerados.*
    arquivo="resultado.dat"
    apaga_arquivos
    tela
    #cat LEIAME.md
    echo "===> Gerar quantos bilhetes da mega-sena?:"
    read bilheteMax
    echo $bilheteMax >> bilhetes.dat

    echo "Rodando sorteio mega-sena $bilheteMax vezes"
    echo "Este script irá gerar $bilheteMax bilhetes aleatórios da mega-sena."
    echo "Em seguida, lhe apresentará um bilhete com os números sugeridos."
    echo
    echo "Pressione ENTER para continuar..."
    read tmp
    echo "Processando....por favor aguarde."

    #echo =================
    for (( bilhete=1; bilhete<=bilheteMax; bilhete++ ))
        do
            #echo "Concurso: " -n "$bilhete "
            echo "=================================" >> bilhetes_gerados.dat
            echo "Bilhete número "$bilhete >> bilhetes_gerados.dat
            echo "---------------------------------" >> bilhetes_gerados.dat
            shuf -i 1-60 -n 6 >> "$bilhete.bil"
            cat  "$bilhete.bil"    >> bilhetes_gerados.dat
            cat  "$bilhete.bil"    >> ns.dat
            #echo "$bilhete gerado"

            #echo "=================================" >> resultado.dat
        done

        #ordena os numeros do arquivo ns.dat e poe o resultado no ns2.dat
        sort -n ns.dat >> ns2.dat
        #identifica os numeros unicos (sorteados) gerados no arquivo ns2.dat e insere no ns3.dat
        cat ns2.dat | uniq >> ns3.dat
        #identifica e conta os arquivos unicos no arquivo ns2.dat e poe o resultado no ns4.dat
        uniq -c ns2.dat > ns4.dat
        #ordena o quantificado arquivo ns4.dat e poe o resultado no ns5.dat
        sort -r ns4.dat > ns5.dat

        cat resultado.dat >> bilhetes_gerados.dat
}

main(){
    inicializa
    #processa
    mostra_resultado
    apaga_arquivos
    echo
    echo "Processamento concluido! Boa sorte!!!"
}

main
