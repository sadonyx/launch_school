def sum_even_number_row(row_number)
  rows = []
  start_int = 2
  (1..row_number).each do |current_row|
    rows << create_row(start_int, current_row)
    start_int = rows[-1][-1] + 2
  end
  rows[-1].sum

end

def create_row(start_int, row_length)
  row = []
  current_integer = start_int
  until row.length == row_length
    row << current_integer
    current_integer += 2
  end
  row
end

p sum_even_number_row(1) == 2 # true
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68

# p create_row(2, 1) == [2]
# p create_row(4, 2) == [4, 6]
# p create_row(8, 3) == [8, 10, 12]