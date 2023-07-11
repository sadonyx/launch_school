require 'date'

class Meetup

  SCHEDULE = %w(first second third fourth fifth)
  
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(wkdy, sched)
    weekday = wkdy.downcase
    schedule = sched.downcase
    case schedule
      when 'teenth' then teenth(weekday)
      when 'last' then last(weekday)
    else
      first_fifth(weekday, schedule)
    end
  end

  private
  attr_reader :year, :month
  
  def first_fifth(weekday, schedule)
    is_it_this_day = "#{weekday}?"
    date = Date.new(year, month, 1)
    loop do
      if date.send(is_it_this_day)
        SCHEDULE.index(schedule).times { date = date.next_day(7) }
        return date.month == month ? date : nil
      else
        date = date.next_day
      end
    end
  end

  def last(weekday)
    is_it_this_day = "#{weekday}?"
    date = Date.new(year, month + 1, 1).prev_day
    loop do
      return date if date.send(is_it_this_day)
      date = date.prev_day
    end
  end

  def teenth(weekday)
    is_it_this_day = "#{weekday}?"
    date = Date.new(year, month, 13)
    loop do
      return date if date.send(is_it_this_day)
      date = date.next_day
    end
  end
end