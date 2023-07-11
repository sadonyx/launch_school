 class Diamond
  def self.make_diamond(letter)
    diamond_arr = []
    counter = 0
    line_length = ((letter.ord - 'A'.ord) * 2) + 1

    line_length.times do |i|
      char = ('A'.ord + counter).chr
      arr = Array.new(line_length) {|_| " " }
      arr[((line_length - 1) / 2) + counter] = char
      arr[((line_length - 1) / 2) - counter] = char
      arr.append("\n")
      diamond_arr << arr.join

      if diamond_arr.size <= (line_length - 1) / 2
        counter += 1
      else
        counter -= 1
      end
    end
    
    
    diamond_arr.join()
  end
end

puts Diamond.make_diamond("B")