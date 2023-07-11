class CustomSet
  def initialize(arr=[])
    @set = arr
  end

  def add(int)
    @set << int if !contains?(int)
    self
  end

  def ==(other)
    eql?(other)
  end

  def empty?
    @set.empty?
  end

  def contains?(int)
    @set.include?(int)
  end

  def subset?(other) # all elements in self are included in other
    self.size <= other.size ? @set.all? { |element| other.contains?(element) } : false
  end

  def disjoint?(other) # self and other do NOT share any element
    @set.none? { |element| other.contains?(element) }
  end

  def eql?(other)
    @set.uniq.size == other.set.size ? @set.all? { |element| other.contains?(element) } : false
  end

  def intersection(other)
    CustomSet.new(@set.select { |element| other.contains?(element) })
  end

  def difference(other)
    CustomSet.new(@set.select { |element| !other.contains?(element) })
  end

  def union(other)
    CustomSet.new((@set + other.set).uniq)
  end

  protected
  attr_reader :set
  
  def size
    @set.length
  end
end