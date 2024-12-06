import sys

menu = {
    "Baja Taco": 4.25,
    "Burrito": 7.50,
    "Bowl": 8.50,
    "Nachos": 11.00,
    "Quesadilla": 8.50,
    "Super Burrito": 8.50,
    "Super Quesadilla": 9.50,
    "Taco": 3.00,
    "Tortilla Salad": 8.00
}

def main():
    total = 0.00
    while True:
        try:
            item = get_in()
            total += check(item.title())
            print("Total:", f"${total:.2f}")
        except EOFError:
            print(f"Final Total: ${total:.2f}")
            sys.exit()
        except ValueError as e:
            print(e)

def get_in():
    return input("Item: ").strip()

def check(item):
    if item in menu:
        return menu[item]
    else:
        raise ValueError("Sorry, that item is not on the menu.")

if __name__ == "__main__":
    main()
