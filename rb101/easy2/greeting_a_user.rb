def greeting
  print "What is your name? "
  user_name = gets.chomp
  
  puts /!/.match(user_name) ? "HELLO #{user_name.chop.upcase}. WHY ARE WE SCREAMING?" : "Hello #{user_name}."
end

greeting