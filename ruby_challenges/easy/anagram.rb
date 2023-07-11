class Anagram
  def initialize(word)
    @word = word
  end

  def match(potentials_arr)
    anagrams = []
    word_permutation.each do |perm|
      potentials_arr.each do |potential|
        anagrams << potential if perm.downcase == potential.downcase && potential.downcase != @word.downcase
      end
    end
    anagrams.uniq
  end

  private

  def word_permutation
    # Gets all (unique) variations of the letters in our word and stores them in an array.
    permutations = @word.chars.permutation.to_a.map do |perm_arr|
      perm_arr.join
    end
  end
end