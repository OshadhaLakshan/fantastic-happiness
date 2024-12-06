input = input("Input: ")

output = ""
for char in input.strip():
    if char in ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]:
        char = ""
    else:
        output += char

print("Output:", output)
