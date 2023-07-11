class Octal
  def initialize(str)
    @digits = to_digits(str)
  end

  def to_decimal
    @digits == 0 ? 0 : 
    @digits.each_with_index.inject(0) do |sum, (value, index)|
      sum += value * (8 ** index)
    end
  end

  private
  
  def to_digits(str) 
    str.chars.all? { |obj| obj.match(/[0-7]/) } ? str.to_i.digits : 0
  end
end