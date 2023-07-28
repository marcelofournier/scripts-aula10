import sys

def binary_to_decimal(binary_number):
    decimal_number = int(binary_number, 2)  # Converte o número binário para decimal
    return decimal_number

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Uso: python binary_to_decimal.py <número binário>")
        sys.exit(1)

    binary_number = sys.argv[1]

    decimal_number = binary_to_decimal(binary_number)

    print("Número binário:", binary_number)
    print("Número decimal:", decimal_number)

