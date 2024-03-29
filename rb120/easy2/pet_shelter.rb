class Pet
  attr_reader :type, :name
  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets
  def initialize(name)
    @name = name
    @pets = []
  end

  def to_s
    name
  end

  def add_new_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.length
  end
end

class Shelter
  attr_accessor :adoptions
  def initialize
    @adoptions = {}
  end

  def adopt(owner, pet)
    owner.add_new_pet(pet)
    adoptions[owner] ? adoptions[owner] << pet : adoptions[owner] = [pet]
  end

  def print_adoptions
    adoptions.each do |owner,pets_arr|
      puts "#{owner} has adopted the following pets:"
      pets_arr.each do |pet|
        puts pet
      end
    puts ""
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."