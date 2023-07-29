#!/bin/bash

# Executa o Nmap na rede local (ajuste o IP/máscara conforme a sua rede)
nmap -sn 192.168.15.0/24 > hosts_status.txt
