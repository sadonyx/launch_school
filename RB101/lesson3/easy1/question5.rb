# Programmatically determine if 42 lies between 10 and 100.

p 10.upto(100).include?(42) # true
p 10.upto(100).include?(9) # false : test case

# The `upto` method creates an array of numbers in between and that includes the number it is called on as well as the number it is given as an argument.
# We then call the `indluce?` method to see if the number in its argument is in the given array.