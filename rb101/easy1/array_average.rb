def average(arr)
  arr.sum / arr.length
end

def average_to_f(arr)
  arr.sum.to_f / arr.length
end

def average_via_reduce(arr)
  arr.reduce(:+) / arr.count
end

puts average([1, 5, 87, 45, 8, 8, 113])
puts average_to_f([1, 5, 87, 45, 8, 8, 113])
puts average_via_reduce([1, 5, 87, 45, 8, 8, 113])

