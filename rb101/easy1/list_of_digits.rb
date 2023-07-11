# List of Digits

def digit_list(int)
  int.to_s.split("").map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]