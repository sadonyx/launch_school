class Series
  def initialize(num)
    @num = to_int_array(num)
  end

  def slices(n)
    raise ArgumentError if n > @num.size
    series 
    @num.each_cons(n) { |arr| series << arr }
    series
  end
  
  def to_int_array(str) 
    str.chars.map { |char| char.to_i }
  end
end