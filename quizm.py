import random

def gerar_pergunta():
    operadores = ['+', '-', '*', '/']
    operacao = random.choice(operadores)
    if operacao == '+':
        num1 = random.randint(1, 20)
        num2 = random.randint(1, 20)
        resposta = num1 + num2
    elif operacao == '-':
        num1 = random.randint(1, 20)
        num2 = random.randint(1, 20)
        resposta = num1 - num2
    elif operacao == '*':
        num1 = random.randint(1, 10)
        num2 = random.randint(1, 10)
        resposta = num1 * num2
    else:
        num2 = random.randint(1, 10)
        resultado = random.randint(1, 10)
        num1 = num2 * resultado
        resposta = resultado

    return f'Quanto é {num1} {operacao} {num2}?', resposta

def main():
    try:
        num_perguntas = int(input("Quantas perguntas você deseja gerar? "))
    except ValueError:
        print("Por favor, insira um número válido.")
        return

    corretas = 0

    for _ in range(num_perguntas):
        pergunta, resposta_correta = gerar_pergunta()
        print(pergunta)
        try:
            resposta_usuario = float(input("Sua resposta: "))
        except ValueError:
            print("Por favor, insira uma resposta válida.")
            continue

        if resposta_usuario == resposta_correta:
            print("Resposta correta!\n")
            corretas += 1
        else:
            print(f"Resposta incorreta. A resposta correta é {resposta_correta}\n")

    print(f"Você acertou {corretas} de {num_perguntas} perguntas.")

if __name__ == "__main__":
    main()

