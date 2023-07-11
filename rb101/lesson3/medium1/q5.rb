# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

limit = 15 # change to a constant
LIMIT = 15

# The issue with the code is that it tries to call on a variable that is not within the local scope of the defined method. The variable limit is an outer scope variable that can only be accessed via including it as a paramter in the method call.
# We can either define the limit variable inside the method definition, or have the method take in a 3rd parameter called "limit" and insert it upon method call.

def fib(first_num, second_num, LIMIT)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, LIMIT)
puts "result is #{result}"