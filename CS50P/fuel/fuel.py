def main():
    try:
        get_in()
    except (ValueError, ZeroDivisionError):
        main()


def to_per(frac):
    num, denom = map(int, frac.split("/"))
    if num > denom:
        raise ValueError
    frac = num / denom
    if frac <= 0.01:
        print("E")
    elif frac >= 0.99:
        print("F")
    else:
        print(f"{frac*100:.0f}", "%", sep="")


def get_in():
    frac = input("Fraction: ")
    to_per(frac)


if __name__ == "__main__":
    main()
