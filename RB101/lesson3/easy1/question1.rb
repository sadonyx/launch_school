# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# 1
# 2
# 2
# 3

=begin
numbers.uniq returns a new Array object with unique elements, but it does not
modify the numbers object. Also, the puts method writes each element on a new line
if passed an array.

If we wanted to output the array in its original format, we would use `p numbers`
or puts numbers.inspect
=end
