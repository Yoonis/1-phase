# Create a collection of pets using a built-in Ruby data structure.
# each pet has name and type
# ex: 
# Perry, dog
# Rufus, cat
# Jane, chimp
# Sally, snake
# Ernie, chimp
# Melvin, hamster

pets = [{name: "Perry", type: "dog"}, 
        {name: "Rufus", type: "cat"},
        {name: "Jane", type: "chimp"},
        {name: "Sally", type: "snake"},
        {name: "Ernie", type: "chimp"},
        {name: "Melvin", type: "hamster"}
       ]

# As a user, I can use a method to add a new pet to the collection.
def add(pets, pet_info)
  pets << pet_info
end

# p add(pets, {name: "Fido", type: "dog"})


# As a user, I can use a method to list the pets in the collection.
def list(pets)
  pets.each { |pet| puts pet }
end 

# list(pets)


# As a user, I can use a method to filter the lists according to type.
def type_filter(pets, type)
  pets.each do |pet|
    if pet[:type] == type
      puts pet
    end
  end
end

# type_filter(pets, "chimp")


# As a user, I can find a pet by providing its name.
def find_by_name(pets, name)
  pets.select {|pet| puts "#{pet[:name]} the #{pet[:type]}" if pet[:name] == name}
end

# find_by_name(pets, "Rufus")


# As a user, I can list pets in pairs (for… play dates???).
def pairs(pets)
  if pets.length.even?
    counter = 0
    (pets.length/2).times do
      puts "#{pets[counter][:name]} the #{pets[counter][:type]} and #{pets[counter+1][:name]} the #{pets[counter+1][:type]}"
      counter += 2
    end
  else
    puts "There are an odd number of pets right now."
  end
end

# pairs(pets)


# As a user, I can list pets alphabetically.
def alphabetize(pets)
  pets.sort! { |a, b| a[:name] <=> b[:name] }
  pets.each { |pet| puts "#{pet[:name]} the #{pet[:type]}" }
end

# alphabetize(pets)


# As a user, I can list pets in a numbered list.
def numbered_list(pets)
  num = 1
  pets.each do |pet| 
    puts "#{num}. #{pet[:name]} the #{pet[:type]}"
    num += 1
  end
end

# numbered_list(pets)


# How would you change your code to add a pet’s age?
# I would add an :age key to each hash element of my pets array.

# How would you change your code to add a pet’s birthday and food?
# The same way I would add a pet's age.

# How would you change your code to add a pet’s exercise regimen and whether its been provided for the day or not?
# The same way I would add a pet's age.

# How would you encapsulate this behavior in a class?
# The pets array would become an instance variable with attr_accessor rights for easy access throughout my methods. A new pet would be instantiated by taking a hash argument that requires :name and :type values at the minimum (every other key is optional). After it's created, this new pet would be pushed to the pets arrays.
