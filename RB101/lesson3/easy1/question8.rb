# Given the hash below

flinstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

# My answer:
flinstones.select!{|k,v| k == "Barney"}
flinstones = flinstones.to_a.flatten!

# Given answer:
flinstones.assoc("Barney")