# How could the following method be simplified without changing its return value?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid_revised(color)
  ["blue", "green"].include?(color) ? true : false 
end

p color_valid_revised("blue")
p color_valid_revised("green")
p color_valid_revised("red")
