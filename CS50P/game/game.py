import random

def main():
    try:
        level = int(input("Level: "))
        integer = random.randint(1, level)

        while True:
            guess = int(input("Guess: "))
            if integer > guess:
                print("Too small!")
            elif integer < guess:
                print("Too large!")
            else:
                print("Just right!")
                break

    except ValueError:
        main()


if __name__ == "__main__":
    main()
