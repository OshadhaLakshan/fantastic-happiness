import cs50

text = cs50.get_string("Text: ")


def count_letters(text):
    letter = 0
    for char in text:
        if char.isalpha():
            letter += 1
    return letter


def count_words(text):
    word = 1
    for i in range(1, len(text)):
        if text[i].isspace() and not text[i - 1].isspace():
            word += 1
    return word


def count_sentences(text):
    sentence = 0
    for char in text:
        if char in ('.', '!', '?'):
            sentence += 1
    return sentence


letters = count_letters(text)
words = count_words(text)
sentences = count_sentences(text)


L = letters / words * 100
S = sentences / words * 100
index = 0.0588 * L - 0.296 * S - 15.8
grade = round(index)


if grade < 1:
    print("Before Grade 1")

elif grade > 16:
    print("Grade 16+")

else:
    print(f"Grade {grade}")
