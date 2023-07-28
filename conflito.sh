import socket
import ipaddress
import sys

def check_ip_conflicts(network):
    # Obtem a lista de IPs para o range da rede
    ip_range = ipaddress.IPv4Network(network)
    print(f"Verificando conflitos de IP na rede: {network}")

    for ip in ip_range:
        # Ignora o próprio IP da máquina em que o script está sendo executado
        if str(ip) == network.split('/')[0]:
            continue
        
        # Tenta criar um socket e se conectar ao IP
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.settimeout(1)  # Tempo limite de 1 segundo para a conexão
                s.connect((str(ip), 80))
        except socket.error:
            pass
        else:
            print(f"Conflito de IP encontrado: {ip}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Uso: python check_ip_conflicts.py <endereco_de_rede>")
        sys.exit(1)

    network = sys.argv[1]
    check_ip_conflicts(network)
