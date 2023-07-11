class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 0 # 0 is a perfect number, I think...
    sum = aliquot_sum(num)

    case
      when sum == num then "perfect"
      when sum > num then "abundant"
      when sum < num then "deficient"
    end
  end

  class << self
    private
  
    def aliquot_sum(num)
      factors_of(num).sum
    end
  
    def factors_of(num)
      (1...num).select { |n| num % n == 0 }
    end
  end
end