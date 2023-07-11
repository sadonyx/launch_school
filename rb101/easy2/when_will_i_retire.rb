def retire
  current_year = Time.now.year
  
  print "What is your age? "
  user_age = gets.chomp.to_i
  print "At what age would you like to retire? "
  desired_retire_age = gets.chomp.to_i
  
  actual_retire_year = current_year + (desired_retire_age - user_age)

  puts "It's #{current_year}. You will retire in #{actual_retire_year}."
  puts "You have only #{desired_retire_age - user_age} years of work to go!"
end

retire