# Shorten the following sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# Cut it like this: 
# "Few things in life are as important as /// house training your pet dinosaur."

advice.slice!(0, advice.index("house"))

p advice