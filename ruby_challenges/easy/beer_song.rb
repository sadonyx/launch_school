class BeerSong
  def self.verse(n)
    case n
      when 0 then self.verse_zero
      when 1 then self.verse_one
      when 2 then self.verse_two
    else
      self.default_verse(n)
    end
  end

  def self.verses(n, m)
    str_arr = []
    n.downto(m) { |num| str_arr << verse(num) }
    str_arr.join("\n")
  end
  
  def self.verse_one
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.verse_two
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def self.verse_zero
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def self.default_verse(n)
    "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
      "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
  end

  def self.lyrics
    verses(99, 0)
  end
end