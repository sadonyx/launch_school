# In this hash of people and their age, see if "Spot" is present.

FALSE_TEST = "Spot"
TRUE_TEST = "Herman"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10}

p ages.include?(FALSE_TEST)

# Bonus: What are two other hash methods that would work just as well for this solution?

p ages.key?(FALSE_TEST)
p ages.member?(FALSE_TEST)