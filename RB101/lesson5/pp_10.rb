# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# => [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

arr_plus_one = arr.map do |obj|
  obj.each_with_object({}) do |(key, value), hash|
    hash[key] = value + 1
  end
end

p arr
p arr_plus_one

# OR
arr.map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]