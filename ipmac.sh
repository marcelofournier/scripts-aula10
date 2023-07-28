#!/bin/bash

network_range="192.168.15.0/24"  # Substitua pela faixa de IP da sua rede local
output_file="active_hosts.txt"
conflict_file="ip_conflicts.txt"

# Realiza o arp-scan para encontrar os hosts ativos na rede local
arp-scan --localnet --interface wlp2s0 --numeric --quiet --ignoredups --output="$output_file" "$network_range"

echo "Hosts ativos na rede local:"
cat "$output_file"
echo "-----------------------"

# Verifica por conflitos de IP
echo "Conflitos de IP detectados:"
awk 'NR>2 {print $1, $2}' "$output_file" | sort | uniq -d | while read ip; do
    grep -w "$ip" "$output_file" >> "$conflict_file"
done

# Exibe resultados
if [ -s "$conflict_file" ]; then
    cat "$conflict_file"
    echo "Existem conflitos de IP na rede local."
else
    echo "Não foram encontrados conflitos de IP na rede local."
fi

# Limpa os arquivos temporários
rm "$output_file" "$conflict_file"

