# Consider this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Determine the total age of just the male members of the family.

p munsters.select { |_,desc| desc["gender"] == "male" }.values.inject(0) {|sum, n| sum + n["age"]}

# OR

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444
