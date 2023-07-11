# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

p statement.count('t')

# Accidental Bonus: count all undercase letters in the string
p statement.split('').select {|char| char == char.downcase && !(char =~ /\W/)}.count