# frozen_string_literal: true

class Parallax
  def self.shift(str1, str2)
    return str1 if str2 == ' '

    final_string = str1.dup
    switch = false

    str1.chars.each_cons(3) do |arr|
      ascii_arr = arr.map(&:ord)
      next unless checks?(arr, ascii_arr, str2)

      switch ? final_string << arr.join : final_string = arr.join + final_string
      switch = !switch
    end
    final_string
  end

  def self.checks?(arr, ascii_arr, str2)
    if arr.uniq.size == 3 &&
       !ascii_arr.include?(' ') &&
       ascii_arr == ascii_arr.sort { |a, b| b <=> a } &&
       str2.include?(arr.join)
      true
    else
      false
    end
  end
end
