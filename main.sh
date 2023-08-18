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
function aguarde() {
  echo
  read -p "Pressione qualquer tecla para continuar... " tecla
}

function prepara(){
   sudo apt update
   sudo apt upgrade
   sudo apt install figlet
   sudo apt install net-tools
}

#18 - classes de rede
function doc_classes_rede() {
clear
echo
echo "RELAÇÃO DAS CLASSES DE REDE E ENDERAÇAMENTO IP:"
echo "Classe A:"
echo
echo "Faixa de endereçamento IP: 0.0.0.0 a 127.255.255.255"
echo "O primeiro octeto (8 bits) é reservado para a parte de rede, e os três octetos restantes (24 bits) são usados para a parte do host.
Classe B:"
echo
echo "Faixa de endereçamento IP: 128.0.0.0 a 191.255.255.255"
echo "Os dois primeiros octetos (16 bits) são reservados para a parte de rede, e os dois octetos restantes (16 bits) são usados para a parte do host."
echo
echo "Classe C:"
echo 
echo "Faixa de endereçamento IP: 192.0.0.0 a 223.255.255.255"
echo "Os três primeiros octetos (24 bits) são reservados para a parte de rede, e o último octeto (8 bits) é usado para a parte do host."
echo
aguarde
}


#19 - calcula rede
function calcula_rede() {
   clear
   read -p "Informe o IP e a máscara de rede no formato CIDR: " valor
   python3 ipcalc.py $valor
   aguarde
}


function doc_portas(){
clear
echo "Relação de principais serviços de rede e suas portas TCP/IP:"
echo
echo "SSH (Secure Shell)..........................: 22"
echo "HTTP (Web)..................................: 80"
echo "HTTPS (Web SSL).............................: 443"
echo "FTP (File Transfer Protocol)................: 21"
echo "FTPS (FTP SSL)..............................: 990"
echo "SMTP (Email - envio)........................: 25"
echo "SMTPS (SMTP SSL)............................: 465"
echo "POP3 (Email - recebimento)..................: 110"
echo "POP3S (POP3 SSL)............................: 995"
echo "IMAP (Email - recebimento)..................: 143"
echo "IMAPS (IMAP SSL)............................: 993"
echo "DNS (Domain Name System)....................: 53"
echo "DHCP (Dynamic Host Configuration Protocol)..: 67/68"
echo "SNMP (Simple Network Management Protocol)...: 161/162"
echo "RDP (Remote Desktop Protocol)	3389"
echo
aguarde
}

function sair() {
  clear
  echo
  figlet cetam redes
  echo
  echo "Obrigado por usar nosso script"
  echo "Para sugestões: prof.marcelofournier@gmail.com"
  echo "=============================================="
  echo
  exit 0
}

function monitorar_log() {
# Verifica se o arquivo de log existe
log_file="/var/log/syslog" # Altere o caminho para o arquivo de log, se necessário

if [ ! -f "$log_file" ]; then
  echo "O arquivo de log $log_file não foi encontrado."
  exit 1
fi

# Utiliza o tail com a opção -f para acompanhar as alterações no arquivo de log
tail -n 20 -f "$log_file"

}

function firewall_ufw() {
    sudo ./xufw.sh
    echo
    aguarde
}

function decimal_binario() {
    echo
    read -p "Informe o número decimal para a conversão: " numero
    python3 binario.py $numero
    echo
    aguarde
}

function binario_decimal() {
    echo
    read -p "Informe o número binário para a conversão: " numero
    python3 decimal.py $numero
    echo
    aguarde
}

function funcao_whois() {
    clear
    figlet whois
    echo
    read -p "Informe o site para consulta: " site
    whois $site
    echo
    aguarde
}

function funcao_nmap() {
    sudo ./xnmap.sh
}

function funcao_dig() {
    sudo ./xdig.sh
}

function ambientes_graficos() {
  sudo ./instalar-ambientes-graficos.sh
}

geolocalizacao() {
  clear
  echo
  figlet geolocalizacao 
  echo
  read -p "Informe o endereço IP desejado: " ip
  geoiplookup $ip
  aguarde
}


function ip_externo() {
  clear
  echo
  figlet ip externo
  echo
  curl ipinfo.io
  echo
  aguarde
}

function documentacao(){
  ./dicas.sh
}

velocidade_conexao() {
  clear
  figlet "Teste da conexão"
  sudo apt-get install speedtest-cli
  speedtest-cli
  aguarde
}

anti_virus() {
  clear
  figlet "antivirus"
  sudo apt install clamav clamav-daemon clamav-freshclam clamtk -y
  clamscan ~/
  aguarde
  
}

function menu() {
# Loop para apresentar o menu até que o usuário escolha a opção de sair
clear
echo "##############################################################################"
figlet .....CETAM Redes....
echo "                   CENTRO DE EDUCAÇÃO TECNOLÓGICA DO AMAZONAS"
echo  "                         by: prof. marcelo fournier v1.1"
echo 
echo "############################## Admin Redes Linux #############################"
data_aspas=`date`
host_aspas=`hostname`
usuario_aspas=`whoami`
mascara_rede=$(ip -o -f inet addr show | awk '{print $4}')
echo "$data_aspas. Host: $host_aspas. Usuario: $usuario_aspas"
echo "$mascara_rede"
echo "##############################################################################"
}

while true; do
  menu 
  echo    " |  1. Usuários           | 9.  ifconfig (ip) | 17. Dicas e notas            |"
  echo    " |  2. Pacotes            | 10. netstat (ss)* | 18. Ambiente gráfico         |" 
  echo    " |  3. Servicos           | 11. ethtool     * | 19. Calcular rede            |"
  echo    " |  4. Nmap na rede       | 12. roteamento    | 20. Firewall ufw             |"
  echo    " |  5. Log do sistema     | 13. whois         | 21. Decimal/binário          |"
  echo    " |  6. Crontab            | 14. traceroute  * | 22. Binário/decimal          |"
  echo    " |  7. Grupos             | 15. dig           | 23. geoiplookup              |"
  echo    " |  8. Journal log        | 16. nmap          | 24. IP externo  25. Glossário|"
  #echo    " ----------------------------------------------------------------------------"
  echo    " |  30. Discos            | 31. USBs          | 32. Espaço em RAM e discos   |"
  echo    " |  33. Speed conexão     | 34. Antivirus     | 35. Checar vulnerabilidades  |"
  echo    " ----------------------------------------------------------------------------"
  read -p "  ===> Escolha uma opção (0 para SAIR): " opcao

  case $opcao in
    1)
      ./xusuarios.sh
      aguarde;;
    2)
      sudo ./xpacotes.sh
      aguarde;;
    3)
      sudo ./xservicos.sh
      aguarde;;
    4)
      sudo ./xnmap.sh
      aguarde;;
    5)
      ./xlog.sh
      aguarde;;

    6)
      ./xcrontab.sh
      aguarde;;

    7) ./xgrupos.sh
       aguarde;;
       
    8) ./xjournal.sh
       aguarde;;
       
    9) sudo ./xifconfig.sh
       aguarde;;
    12) ./rotas.sh
        aguarde;;   
    13) funcao_whois;;
    15) funcao_dig;;
    16) funcao_nmap;;
    17) documentacao;;
    18) ambientes_graficos;; 
    19) calcula_rede;;
    20) firewall_ufw;;
    21) decimal_binario;;
    22) binario_decimal;;
    23) geolocalizacao;;
    24) ip_externo;;
    25) ./glossario.sh;;
    
    30) clear
        lsblk
        aguarde;;
    31) clear
        lsusb -tv
        aguarde;;
    32) clear
        figlet "ram e discos"
        free -h
        echo
        df -h
        aguarde;;
    33) velocidade_conexao;;
    34) ./xclamav.sh;;
    35) ./xrkhunter.sh;;
    0)  
      sair;;
      
    *)
      echo "Opção inválida. Por favor, verifique!."
      ;;
  esac

  echo
done
