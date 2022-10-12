def tip_calculator
  print "What is the bill? "
  bill = gets.chomp.to_f
  
  print "What is the tip percentage? "
  percentage = gets.chomp.to_f / 100

  tip = (bill * percentage).round(2)
  total = bill + tip

  puts "The tip is $#{format("%.2f", tip)}\nThe total is $#{format("%.2f", total)}"
end

tip_calculator