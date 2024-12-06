from pyfiglet import Figlet
import sys

f = Figlet()

# Ensure the script is called with the correct arguments
if len(sys.argv) == 1:
    user_input = input("Input: ")
    print("Output:\n", f.renderText(user_input))
elif len(sys.argv) == 3:
    flag = sys.argv[1]
    font_name = sys.argv[2]
    if flag == '-f':
        try:
            figlet = Figlet(font=font_name)
            user_input = input("Input: ")
            print("Output:\n", figlet.renderText(user_input))
        except Exception as e:
            print(f"Error: {e}")
    else:
        print("Invalid flag. Use -f to specify font.")
        sys.exit(1)
else:
    print("Usage: python figlet.py -f <font>")
    sys.exit(1)
