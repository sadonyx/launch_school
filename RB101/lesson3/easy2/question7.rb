# How can we add multiple items to our array? (Dino and Hoppy)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.append(%w(Dino Hoppy)).flatten!

# OR

flintstones.push("Dino").push("Hoppy")

p flintstones