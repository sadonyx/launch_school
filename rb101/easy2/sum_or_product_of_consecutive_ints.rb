def spc
  print "Please enter a integer greater than 0: "
  user_int = gets.chomp.to_i
  print "Enter 's' to compute the sum, 'p' to compute the product: "
  user_op = gets.chomp

  case user_op
  when 's'
    sum = 1.upto(user_int).to_a.sum
    puts "The sum of the integers between 1 and #{user_int} is #{sum}."
  when 'p'
    product = 1.upto(user_int).to_a.inject(:*)
    puts "The product of the integers between 1 and #{user_int} is #{user_int * user_op}."
  end
end

spc