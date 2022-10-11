# How Many?

def count_occurences(arr)
  hash = {}
  
  arr.uniq.each { |i| hash[i] = 0 }

  arr.each do |i|
    hash[i] ? hash[i] += 1 : next
  end

  p hash
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurences(vehicles)