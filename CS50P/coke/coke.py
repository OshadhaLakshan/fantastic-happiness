amount = 50

while True:
    print("Amount Due:", amount)
    insert = int(input("Insert Coin: "))

    if insert in [25, 10, 5]:
        amount = amount - insert
        if amount <= 0:
            print("Change Owed:", -amount)
            break

    if amount == 0:
        print("Change Owed:", amount)
        break
