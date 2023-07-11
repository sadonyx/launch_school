def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

def factors_revised(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0 && number != 0
    divisor -= 1
  end
  factors
end

p factors_revised(72)

# Bonus 1: What is the purpose of `number % divisor == 0`?
  # A factor of a number is one that divides evenly into it, leaving a remainder of 0.

# Bonus 2: What is the purpose of line 8 in the method?
  # Stating the ARRAY `factors` at the end of the method will cause it to be the method's return value. If `factors` were not stated at the end of the method definition, `nil` would be returned.