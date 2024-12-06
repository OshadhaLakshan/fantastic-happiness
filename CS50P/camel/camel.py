def main():
    camel = input("camelCase: ")
    snake = cam_snake(camel)

    print("snake_case:", snake)


def cam_snake(cam):
    snake = ""
    for char in cam:
        if char.isupper():
            snake += f"_{char.lower()}"
        else:
            snake += char
    return snake


if __name__ == "__main__":
    main()
