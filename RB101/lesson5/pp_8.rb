# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = 'aeiouAEIOU'

hsh.each_value do |arr|
  arr.each do |str|
    str.split('').each do |char|
      puts char if VOWELS.include?(char)
    end
  end
end