module Walkable
 def walk
  puts "#{name} #{gait} forward"
 end
end

class Noble

  include Walkable

  def initialize(name, title)
    @name = name
    @title = title
  end

  def gait
    "struts"
  end

  def name
    "#{@title} #{@name}"
  end

end

byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"