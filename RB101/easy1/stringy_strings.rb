def stringy(int)
  string = ""
  int.times do
    string.length.even? ? string += "1" : string += "0"
  end
  string
end

puts stringy(6) == "101010"
puts stringy(9) == "101010101"