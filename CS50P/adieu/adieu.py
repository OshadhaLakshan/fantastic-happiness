"""
# METHODS:

# plural plural_noun plural_verb plural_adj singular_noun no num
# compare compare_nouns compare_nouns compare_adjs
# a an
# present_participle
# ordinal number_to_words
# join
# inflect classical gender
# defnoun defverb defadj defa defan


# UNCONDITIONALLY FORM THE PLURAL

print("The plural of ", word, " is ", p.plural(word))


# CONDITIONALLY FORM THE PLURAL

print("I saw", cat_count, p.plural("cat", cat_count))


# FORM PLURALS FOR SPECIFIC PARTS OF SPEECH

print(
    p.plural_noun("I", N1),
    p.plural_verb("saw", N1),
    p.plural_adj("my", N2),
    p.plural_noun("saw", N2),
)


# FORM THE SINGULAR OF PLURAL NOUNS

print("The singular of ", word, " is ", p.singular_noun(word))

# SELECT THE GENDER OF SINGULAR PRONOUNS

print(p.singular_noun("they"))  # 'it'
p.gender("feminine")
print(p.singular_noun("they"))  # 'she'


# DEAL WITH "0/1/N" -> "no/1/N" TRANSLATION:

print("There ", p.plural_verb("was", errors), p.no(" error", errors))


# USE DEFAULT COUNTS:

print(
    p.num(N1, ""),
    p.plural("I"),
    p.plural_verb(" saw"),
    p.num(N2),
    p.plural_noun(" saw"),
)
print("There ", p.num(errors, ""), p.plural_verb("was"), p.no(" error"))


# COMPARE TWO WORDS "NUMBER-INSENSITIVELY":

if p.compare(word1, word2):
    print("same")
if p.compare_nouns(word1, word2):
    print("same noun")
if p.compare_verbs(word1, word2):
    print("same verb")
if p.compare_adjs(word1, word2):
    print("same adj.")


# ADD CORRECT "a" OR "an" FOR A GIVEN WORD:

print("Did you want ", p.a(thing), " or ", p.an(idea))


# CONVERT NUMERALS INTO ORDINALS (i.e. 1->1st, 2->2nd, 3->3rd, etc.)

print("It was", p.ordinal(position), " from the left\n")

# CONVERT NUMERALS TO WORDS (i.e. 1->"one", 101->"one hundred and one", etc.)
# RETURNS A SINGLE STRING...

words = p.number_to_words(1234)
# "one thousand, two hundred and thirty-four"
words = p.number_to_words(p.ordinal(1234))
# "one thousand, two hundred and thirty-fourth"


# GET BACK A LIST OF STRINGS, ONE FOR EACH "CHUNK"...

words = p.number_to_words(1234, wantlist=True)
# ("one thousand","two hundred and thirty-four")


# OPTIONAL PARAMETERS CHANGE TRANSLATION:

words = p.number_to_words(12345, group=1)
# "one, two, three, four, five"

words = p.number_to_words(12345, group=2)
# "twelve, thirty-four, five"

words = p.number_to_words(12345, group=3)
# "one twenty-three, forty-five"

words = p.number_to_words(1234, andword="")
# "one thousand, two hundred thirty-four"

words = p.number_to_words(1234, andword=", plus")
# "one thousand, two hundred, plus thirty-four"
# TODO: I get no comma before plus: check perl

words = p.number_to_words(555_1202, group=1, zero="oh")
# "five, five, five, one, two, oh, two"

words = p.number_to_words(555_1202, group=1, one="unity")
# "five, five, five, unity, two, oh, two"

words = p.number_to_words(123.456, group=1, decimal="mark")
# "one two three mark four five six"
# TODO: DOCBUG: perl gives commas here as do I

# LITERAL STYLE ONLY NAMES NUMBERS LESS THAN A CERTAIN THRESHOLD...

words = p.number_to_words(9, threshold=10)  # "nine"
words = p.number_to_words(10, threshold=10)  # "ten"
words = p.number_to_words(11, threshold=10)  # "11"
words = p.number_to_words(1000, threshold=10)  # "1,000"

# JOIN WORDS INTO A LIST:

mylist = p.join(("apple", "banana", "carrot"))
# "apple, banana, and carrot"

mylist = p.join(("apple", "banana"))
# "apple and banana"

mylist = p.join(("apple", "banana", "carrot"), final_sep="")
# "apple, banana and carrot"


# REQUIRE "CLASSICAL" PLURALS (EG: "focus"->"foci", "cherub"->"cherubim")

p.classical()  # USE ALL CLASSICAL PLURALS

p.classical(all=True)  # USE ALL CLASSICAL PLURALS
p.classical(all=False)  # SWITCH OFF CLASSICAL MODE

p.classical(zero=True)  #  "no error" INSTEAD OF "no errors"
p.classical(zero=False)  #  "no errors" INSTEAD OF "no error"

p.classical(herd=True)  #  "2 buffalo" INSTEAD OF "2 buffalos"
p.classical(herd=False)  #  "2 buffalos" INSTEAD OF "2 buffalo"

p.classical(persons=True)  # "2 chairpersons" INSTEAD OF "2 chairpeople"
p.classical(persons=False)  # "2 chairpeople" INSTEAD OF "2 chairpersons"

p.classical(ancient=True)  # "2 formulae" INSTEAD OF "2 formulas"
p.classical(ancient=False)  # "2 formulas" INSTEAD OF "2 formulae"


# INTERPOLATE "plural()", "plural_noun()", "plural_verb()", "plural_adj()", "singular_noun()",
# a()", "an()", "num()" AND "ordinal()" WITHIN STRINGS:

print(p.inflect("The plural of {0} is plural('{0}')".format(word)))
print(p.inflect("The singular of {0} is singular_noun('{0}')".format(word)))
print(p.inflect("I saw {0} plural('cat',{0})".format(cat_count)))
print(
    p.inflect(
        "plural('I',{0}) "
        "plural_verb('saw',{0}) "
        "plural('a',{1}) "
        "plural_noun('saw',{1})".format(N1, N2)
    )
)
print(
    p.inflect(
        "num({0}, False)plural('I') "
        "plural_verb('saw') "
        "num({1}, False)plural('a') "
        "plural_noun('saw')".format(N1, N2)
    )
)
print(p.inflect("I saw num({0}) plural('cat')\nnum()".format(cat_count)))
print(p.inflect("There plural_verb('was',{0}) no('error',{0})".format(errors)))
print(p.inflect("There num({0}, False)plural_verb('was') no('error')".format(errors)))
print(p.inflect("Did you want a('{0}') or an('{1}')".format(thing, idea)))
print(p.inflect("It was ordinal('{0}') from the left".format(position)))


# ADD USER-DEFINED INFLECTIONS (OVERRIDING INBUILT RULES):

p.defnoun("VAX", "VAXen")  # SINGULAR => PLURAL

p.defverb(
    "will",  # 1ST PERSON SINGULAR
    "shall",  # 1ST PERSON PLURAL
    "will",  # 2ND PERSON SINGULAR
    "will",  # 2ND PERSON PLURAL
    "will",  # 3RD PERSON SINGULAR
    "will",  # 3RD PERSON PLURAL
)

p.defadj("hir", "their")  # SINGULAR => PLURAL

p.defa("h")  # "AY HALWAYS SEZ 'HAITCH'!"

p.defan("horrendous.*")  # "AN HORRENDOUS AFFECTATION"
"""

import sys
import inflect

p = inflect.engine()

name_list = []

try:
    while True:
        name = input("Name: ")
        if not name:  # Break loop if no input is provided
            break
        name_list.append(name)
except EOFError:
    print()

print("Adieu, adieu, to", p.join(name_list))
sys.exit(0)

