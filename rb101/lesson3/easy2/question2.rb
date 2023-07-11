# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original `munsters_description` above):
  # every letter except the first of each word capitalized
  # only the first letter of the string capitalized
  # all undercase
  # all uppercase

munsters_1 = munsters_description.downcase.split().map{|obj| obj.capitalize}.join(' ').swapcase

munsters_2 = munsters_description.capitalize

munsters_3 = munsters_description.downcase

munsters_4 = munsters_description.upcase

p munsters_1
p munsters_2
p munsters_3
p munsters_4