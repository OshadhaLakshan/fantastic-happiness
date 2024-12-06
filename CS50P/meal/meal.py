def main():
    time = input("What time is it? ")
    hrs = convert(time)

    if 7 <= hrs <= 8:
        print("breakfast time")
    elif 12 <= hrs <= 13:
        print("lunch time")
    elif 18 <= hrs <= 19:
        print("dinner time")
    else:
        print("Not meal time")


def convert(time):
    hours, minutes = map(int, time.split(":"))
    hrs = hours + (minutes/60)
    return hrs


if __name__ == "__main__":
    main()
