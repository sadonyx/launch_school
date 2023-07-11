class Clock
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end
  
  def self.at(hour, minute=0)
    new(hour, minute)
  end
  
  def +(min) #non-mutating
    hour = @hour + (min / 60)
    minute = @minute + (min % 60)
    format(hour, minute)
  end

  def -(min) #non-mutating
    hour = @hour - (min / 60)
    minute = @minute - (min % 60)
    format(hour, minute)
  end

  def to_s
    "#{handle_hour}:#{handle_minute}"
  end

  def ==(other)
    self.hour == other.hour && self.minute == other.minute
  end

  private
  def handle_hour
    case @hour
      when 0..9 then "0#{@hour}"
      when 10..24 then "#{@hour}"
    end
  end

  def handle_minute
    case @minute
      when 0..9 then "0#{@minute}"
      when 10..60 then "#{@minute}"
    end
  end

  def format(hour, minute) #reformat time to account for new hours
    if minute > 60
      hour += minute / 60
    elsif minute < 0
      hour += minute / 60
    end
    minute = minute % 60
    hour = hour % 24
    Clock.new(hour, minute) #return new Clock object to accomodate for non-mutating
  end
  
  protected
  attr_reader :hour, :minute
end

# format now returns self => created two new errors => needs consistency...