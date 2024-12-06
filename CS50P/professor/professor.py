import random


def main():
    while True:
        try:
            level = get_level()
            game(level)
            break
        except ValueError:
            continue
        except EOFError:
            print("\nGoodbye!")
            break


def game(level):
    score = 0

    for _ in range(10):
        x = generate_integer(level)
        y = generate_integer(level)
        correct_answer = x + y

        for _ in range(3):  # Allow up to 3 attempts per question
            try:
                user_answer = int(input(f"{x} + {y} = "))
                if user_answer == correct_answer:
                    score += 1
                    break
                else:
                    print("EEE")
            except ValueError:
                print("EEE")

        # If all attempts fail, show the correct answer
        if user_answer != correct_answer:
            print(f"{x} + {y} = {correct_answer}")

    print("Score:", score)


def get_level():
    while True:
        try:
            level = int(input("Level: "))
            if level in (1, 2, 3):
                return level
            else:
                print("Invalid level. Choose 1, 2, or 3.")
        except ValueError:
            print("Invalid input. Please enter an integer.")


def generate_integer(level):
    if level == 1:
        return random.randint(0, 9)
    elif level == 2:
        return random.randint(10, 99)
    elif level == 3:
        return random.randint(100, 999)


if __name__ == "__main__":
    main()
