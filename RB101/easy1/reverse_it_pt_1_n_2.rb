# Part 1

def reverse_sentence(str)
  str.split(" ").reverse.join(" ")
end

puts reverse_sentence("Hello World") == "World Hello"
puts reverse_sentence("Reverse these words") == "words these Reverse"

# Part 2

def reverse_words(str)
  reversed = str.split(" ").map do |i|
    i.length >= 5 ? i.chars.reverse.join("") : i
  end

  reversed.join(" ")
end

puts reverse_words("Hell World")
puts reverse_words("Walk around the block")