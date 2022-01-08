# counter = 0
#
# loop do
#   counter += 1
#   next if counter.odd?
#   puts counter
#   break if counter > 5
# end

# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# counter = 0
#
# loop do
#   break if counter == alphabet.size
#   puts alphabet[counter]
#   counter += 1
# end

# colors = ['green', 'blue', 'purple', 'orange']
# counter = 0
#
# loop do
#   break if counter == colors.size
#   puts "I'm the color #{colors[counter]}!"
#   counter += 1
# end

number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end
