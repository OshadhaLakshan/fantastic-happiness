expression = input("Expression: ")

# Split the input into three parts
x, operator, z = expression.split()

# Convert x and z to floats
x = float(x)
z = float(z)

# Perform the operation based on the operator
if operator == "+":
    answer = x + z
elif operator == "-":
    answer = x - z
elif operator == "*":
    answer = x * z
elif operator == "/":
    answer = x / z
else:
    answer = "Invalid operator"

# Print the result rounded to one decimal place
if isinstance(answer, float):
    print(f"{answer:.1f}")
else:
    print(answer)
