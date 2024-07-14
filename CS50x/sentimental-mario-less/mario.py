import cs50

while True:
    n = cs50.get_int("Height: ")
    if 0 < n < 9:
        break
for i in range(n):
    for k in range(n-i, 1, -1):
        print(" ", end="")
    for j in range(0, i+1, 1):
        print("#", end="")
    print()
