input = input()

if ":)" in input:
    input = input.replace(":)", "🙂")
if ":(" in input:
    input = input.replace(":(", "🙁")

print(input)
