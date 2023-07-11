# Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

# => [[], [3, 12], [9], [15]]

mult_of_three_select = arr.map do |sub|
  sub.select do |num|
    num if num % 3 == 0
  end
end

# OR

mult_of_three_reject = arr.map do |sub|
  sub.reject do |num|
    num if num % 3 != 0
  end
end

p mult_of_three_select
p mult_of_three_reject