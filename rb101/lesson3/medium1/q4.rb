# Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to concatenate an element to the buffer?

ex_arr_1 = [1, 2, 3, 4, 5]
MAX = 6

# << is a mutating method in that it will change the original array given as an argument.
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Better solution in that it does not have any side effects and only returns a new array (does not modify the original array.)
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

p rolling_buffer1(ex_arr_1, MAX, 6)
p rolling_buffer2(ex_arr_2, MAX, 7)
