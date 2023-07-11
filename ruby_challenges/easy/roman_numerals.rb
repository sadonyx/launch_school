# 1, 2, 3 => I, II, III
# 4, 5, => IV, V
# 6, 7, 8 = > VI, VII, VIII
# 9, 10 => IX, X

# Before a 5 or 10, we will go 'one' down from that unit

class RomanNumeral
  def initialize(int)
    @int = int
    @digits = int.digits
  end

  def to_roman
    size = @digits.size
    roman = ''
    
    roman << thousands if size > 3
    roman << hundreds if size > 2
    roman << tens if size > 1
    roman << ones if size > 0

    roman
  end

  private

  def thousands
    num = @digits[3]
    'M' * num
  end

  def hundreds
    num = @digits[2]
    case num
      when 9 then 'CM'
      when 6..8 then 'D' + ('C' * (num % 5))
      when 5 then 'D'
      when 4 then 'CD' 
      when 0..3 then 'C' * num
    end
  end

  def tens
    num = @digits[1]
    case num
      when 9 then 'XC'
      when 6..8 then 'L' + ('X' * (num % 5))
      when 5 then 'L'
      when 4 then 'XL' 
      when 0..3 then 'X' * num
    end
  end
  
  def ones
    num = @digits[0]
    case num
      when 9 then 'IX'
      when 6..8 then 'V' + ('I' * (num % 5))
      when 5 then 'V'
      when 4 then 'IV' 
      when 0..3 then 'I' * num
    end
  end
end