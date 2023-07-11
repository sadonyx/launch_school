# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

famous_words_updated_1 = "Four scores and " << famous_words
famous_words_updated_2 = "Four scores and " + (famous_words)
famous_words_updated_3 = famous_words.prepend("Four scores and ")

p famous_words_updated_1
p famous_words_updated_2
p famous_words_updated_3