class SumOfMultiples
  
  def initialize(*ints)
    @set = ints.size > 0 ? ints : [3, 5] 
  end

  def to(int)
    (1...int).inject(0) do |sum, n|
      @set.any? { |m| n % m == 0 } ? sum += n : sum
    end
  end
  
  def self.to(int)
    SumOfMultiples.new().to(int)
  end
end