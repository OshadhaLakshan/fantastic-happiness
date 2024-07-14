import cs50

while True:
    dollars = cs50.get_float("Change: ")
    if dollars > 0:
        break


def calculate_change(dollars):

    cents = int(dollars * 100)

    quarters = cents // 25
    cents %= 25

    dimes = cents // 10
    cents %= 10

    nickels = cents // 5
    cents %= 5

    pennies = cents

    return quarters + dimes + nickels + pennies


cash = calculate_change(dollars)

print(f"{cash}")
