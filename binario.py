import sys

def decimal_to_binary(decimal_number):
    binary_number = bin(decimal_number)[2:]  # Converte o número decimal para binário (removendo o prefixo '0b')
    return binary_number

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Uso: python decimal_to_binary.py <número decimal>")
        sys.exit(1)

    decimal_number = int(sys.argv[1])

    binary_number = decimal_to_binary(decimal_number)

    print("Número decimal:", decimal_number)
    print("Número binário:", binary_number)

