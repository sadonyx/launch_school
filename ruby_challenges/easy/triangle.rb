# Problem: Given 3 side lengths, determine the type of triangle

# Input: 3 Integer parameters
# Output: Type of triangle

# Data Structure: Array - Store the side lengths in an array

class Triangle
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3].sort
    raise ArgumentError if is_legal? 
  end

  def kind
    return 'equilateral' if is_equilateral?
    return 'scalene' if is_scalene?
    return 'isosceles' if is_isosceles?
  end

  def is_equilateral?
    @sides.count(@sides[0]) == 3
  end

  def is_scalene?
    @sides.uniq.size == 3
  end

  def is_isosceles?
    @sides[0] != @sides[1] && @sides[1] == @sides[2]
  end

  def is_legal?
    @sides[0..1].sum <= @sides[2]
  end
end