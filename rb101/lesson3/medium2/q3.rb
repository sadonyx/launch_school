# Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # pumpkins
puts "My array looks like this now: #{my_array}" # ["pumpkins", "rutabaga"]

# The String#+= operation is re-assignment and creates a new String object. The reference to this new object is assigned to a_string_param. The local variable a_string_param now points to "pumpkinsrutabaga", not "pumpkins". It has been re-assigned by the String#+= operation. This means that a_string_param and my_string no longer point to the same object.

# With the array, one array object can have any number of elements. When we attach an additional element to an array using the << operator, Ruby simply keeps using the same object that was passed in, and appends the new element to it.