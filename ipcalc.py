import ipaddress
import sys

def calcular_info_ip(ip_address):
    # Converte a string de endereço IP em um objeto de endereço IP
    rede = ipaddress.ip_network(ip_address, strict=False)

    # Obtém o endereço de rede
    endereco_rede = rede.network_address

    # Obtém a máscara de rede
    mascara_rede = rede.netmask

    # Obtém o endereço de broadcast
    endereco_broadcast = rede.broadcast_address

    # Obtém a faixa de endereços IP disponíveis
    primeiro_endereco = rede.network_address + 1
    ultimo_endereco = rede.broadcast_address - 1

    # Retorna as informações calculadas
    return endereco_rede, mascara_rede, endereco_broadcast, primeiro_endereco, ultimo_endereco

# Obtém o endereço IP fornecido como parâmetro na linha de comando
endereco_ip = sys.argv[1]

# Calcula as informações do endereço IP
endereco_rede, mascara_rede, endereco_broadcast, primeiro_endereco, ultimo_endereco = calcular_info_ip(endereco_ip)

# Imprime as informações calculadas
print(f"Endereço de rede: {endereco_rede}")
print(f"Máscara de rede: {mascara_rede}")
print(f"Endereço de broadcast: {endereco_broadcast}")
print(f"Faixa de endereços IP disponíveis: {primeiro_endereco} - {ultimo_endereco}")

