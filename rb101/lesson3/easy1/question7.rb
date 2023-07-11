=begin
If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

We will end up with this nested array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]
=end

# Make this into an un-nested array.

flintstones = ["Fred", "Wilma"]

# Option 1:

flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!

# Option 2:

flintstones.concat(["Barney", "Betty"], ["BamBam", "Pebbles"])

p flintstones