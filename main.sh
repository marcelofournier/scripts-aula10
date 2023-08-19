#!/bin/bash
linha() {
  echo "-----------------------------------------------------------------------------------------"
}

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
    linha
    echo "Consulta informações sobre um domínio registrado"
    linha
    echo
    read -p "Informe o site para consulta (ex. www.ubuntu.com): " site
    whois $site
    echo
    linha
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
linha
figlet .....CETAM Redes....
echo "                   CENTRO DE EDUCAÇÃO TECNOLÓGICA DO AMAZONAS"
echo  "                         by: prof. marcelo fournier v1.2"
#echo 
linha
data_aspas=`date`
host_aspas=`hostname`
usuario_aspas=`whoami`
mascara_rede=$(ip -o -f inet addr show | awk '{print $4}')
echo "$data_aspas. Host: $host_aspas. Usuario: $usuario_aspas"
echo "$mascara_rede"
linha
}

while true; do
  menu 
  echo    "| SERVIÇOS LOCAIS  |   SERVIÇOS DE REDE    |       DIVERSOS        |    OUTROS & DOCS    |"
  linha
  echo    "| 1. Usuários      | 11. Antivirus         | 21. Roteamento rede   | 31. Monitorar espaco|"
  echo    "| 2. Grupos        | 12. Vulnerabilidades  | 22. Calcular rede IP  | 32. Mon alterações  |" 
  echo    "| 3. Programas     | 13. IP interno        | 23. Geolocalização IP | 33. Falhas no boot  |"
  echo    "| 4. Memória       | 14. IP externo        | 24. python web server | 34. Conexões/arquivo|"
  echo    "| 5. Discos        | 15. Placas de rede    | 25. Gerar carga CPU   | 35. Ambiente gráfico|" 
  echo    "| 6. USBs          | 16. Tráfego na rede   | 26. whois             | 36. Decimal/binário |"
  echo    "| 7. Serviços      | 17. Varredura rede    | 27. dig               | 37. Binário/decimal |"
  echo    "| 8. Crontab       | 18. Conexões na rede  | 28. Log do sistema    | 38. Dicas e notas   |"
  echo    "| 9. Firewall      | 19. Speed test        | 29. journal log       | 39. Glossário       |"
  echo    "| 10. SSH tools    | 20. Largura de banda  | 30. Atividade em disco| 40. Host shutdown   |"
  linha
  read -p " ===> Escolha uma opção (0 para SAIR): " opcao 

  case $opcao in
    1)
      ./xusuarios.sh
      aguarde;;
    2) #grupos
       ./xgrupos.sh
       aguarde;;
    3)  #programas/pacotes
        sudo ./xpacotes.sh
        aguarde;;
    4)  clear
        figlet "ram e discos"
        echo "Memória RAM e discos locais"
        linha
        free -h
        echo
        df -h
        aguarde;;
     5) #discos
        clear
        figlet "discos linux"
        linha
        lsblk
        linha
        aguarde;;
     6) # usb lista
        clear
        figlet "usb"
        linha
        lsusb -tv
        linha
        aguarde;;
     7) #servicos
        sudo ./xservicos.sh
        aguarde;;
      8) #crontab
         ./xcrontab.sh
        aguarde;;

    4)
      sudo ./xnmap.sh
      aguarde;;
    5)
      ./xlog.sh
      aguarde;;
    9) firewall_ufw;;
    10) ./xssh.sh;;
    11) ./xclamav.sh;;
    12) ./xrkhunter.sh;;
    13) ip addr show | grep 'inet ' | awk '{print $2}' | cut -d '/' -f1
        aguarde;;
    14) ip_externo;;
    15) #placas de rede
        sudo ./xifconfig.sh
        aguarde;;
    16) clear
       figlet "iftop linux"
       ifconfig
       read -p "Informe a interface de rede desejada: " interface
       sudo iftop -i $interface
       aguarde;;
    17) funcao_nmap;;
    18) sudo ./xss.sh;;
    19) velocidade_conexao;;
    20) ./xlargurabanda.sh;;
    21) ./rotas.sh
        aguarde;;
    22) calcula_rede;;
    23) geolocalizacao;; 
    24) #python http server
        clear
        figlet "http server"
        linha
        python3 -m http.server
        aguarde;;     
    25) #gerar carga
        clear
        figlet "gerar carga"
        linha
        ./gerar_carga.sh
        aguarde;;
  
    26) funcao_whois;;
    27) funcao_dig;;
    28) ./xlog.sh;;
    29) ./xjournal.sh;;
    30) #iotop
        clear
        sudo iotop -o
        aguarde;;

    31) clear
        figlet "disco free"
        linha
        echo "Monitorando o espaço em disco em tempo real"
        watch -d df -h
        linha
        aguarde;;
    32) clear
        figlet "alteracoes"
        linha
        echo "Monitorando alterações em diretórios e arquivos"
        linha
        read -p "Informe o diretório para monitoramento: " diretorio
        read -p "Informe o caminho completo e o nome do arquivo de destino: " destino
        sudo apt install iwatch -y
        iwatch -r $diretorio > $destino
        linha
        aguarde;;
    33) 
        clear
        figlet "boot fail"
        linha
        echo "Monitorando falhas durante o boot"
        linha
        sudo cat /var/log/boot.log | more
        linha
        aguarde;;
        
    34) #arquivos abertos por conexões de rede/usuario
        clear
        watch lsof -i;;
        
    35) ambientes_graficos;; 
    36) decimal_binario;;
    37) binario_decimal;;
    38) documentacao;;
    39) ./glossario.sh;;


    40) ./xdesligar.sh;;
    0)  
      sair;;
      
    *)
      echo "Opção inválida. Por favor, verifique!."
      ;;
  esac

  echo
done
