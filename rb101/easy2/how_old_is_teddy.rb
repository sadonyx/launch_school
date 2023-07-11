def age()
  print "What is your name? "
  name = gets.chomp
  puts "#{name != "" ? name : "Teddy"} is #{rand(20...200)} years old!"
end

age