numbers = [1, 2, 3, 4, 5]

# What do the following method calls to (assume we reset `numbers` to the original array between method calls)?

numbers.delete_at(1) # numbers is now [1, 3, 4, 5]
# this method deletes the array item at the given index (in this case at index 1)
# the return value of this call is the removed item `2`

numbers.delete(1) # numbers is now [2, 3, 4, 5]
# this method deletes the specified item in the array (in this case the item with value 1)
# the return value of this call is the removed item `1`

# although they do NOT have the usual `!` at the end of the method name, both of these methods are "modify in place" methods