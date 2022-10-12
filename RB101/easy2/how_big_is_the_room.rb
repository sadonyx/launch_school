SQMETER_TO_SQFT = 10.7639
SQFT_TO_SQIN = 144
SQFT_TO_SQCM = 929.03

def room_size
  print "Enter the length of the room in meters: "
  length = gets.chomp.to_f
  print "Enter the width of the room in meters: "
  width = gets.chomp.to_f
  area_meter = length * width
  area_sqft = (area_meter * SQMETER_TO_SQFT).round(2)
  puts "The area of the room is #{area_meter} square meters (#{area_sqft} square feet)."
end

def room_size_adv
  print "Enter the length of the room in feet: "
  length = gets.chomp.to_f
  print "Enter the width of the room in feet: "
  width = gets.chomp.to_f
  area_sqft = (length * width)
  area_sqin = (area_sqft * SQFT_TO_SQIN).round(2)
  area_sqcm = (area_sqft * SQFT_TO_SQCM).round(2)
  puts "The area of the room is #{area_sqft} square feet (#{area_sqin} square inches ; #{area_sqcm} square centimeters)."
end

room_size_adv