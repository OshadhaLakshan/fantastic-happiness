def main():
    plate = input("Plate: ")
    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")


def is_valid(s):
    if not (2 <= len(s) <= 6):
        return False
    if not s[0:2].isalpha():
        return False
    if not s.isalnum():
        return False

    num_started = False

    for i, char in enumerate(s):
        if char.isdigit():
            if char == '0' and (i == 0 or not s[i - 1].isdigit()):
                return False
            num_started = True
        elif num_started:
            return False

    return True


if __name__ == "__main__":
    main()
