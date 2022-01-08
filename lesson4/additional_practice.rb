# # problem 1
# flintstones = %w(Fred Barney Wilma Betty Pebbles BamBam)
#
# # flintstones_hash = flintstones.each_with_object({}) do |name, hash|
# #   hash[name] = flintstones.index(name)
# # end
#
# flintstones_hash = {}
#
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end
#
# p flintstones_hash

# # problem 2
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
#   "Marilyn" => 22, "Spot" => 237 }
#
# p ages.values.inject(:+)

# # problem 3
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# # old = ages.select { |name, age| age >= 100 }
# # old.each { |name, age| ages.delete(name) }
# # p ages
#
# # provided solution:
# ages.keep_if { |_, age| age < 100 }
# p ages


# # problem 4
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, + \
#   "Marilyn" => 22, "Spot" => 237 }
# # min_age = nil
# # ages.values.each do |age|
# #   min_age = age if ((min_age == nil) || (age <= min_age))
# # end
# # p min_age
#
# # provided solution:
# p ages.values.min

# # problem 5
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# # start_be = flintstones.select {|name| name =~ /Be/ }
# # start_be.each {|name| puts flintstones.index(name)}
# p flintstones.index { |name| name[0, 2] == 'Be' }

# # problem 6
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.map! { |name| name[0, 3] }
# p flintstones

# # problem 7
# statement = "The Flintstones Rock"
# # incomplete first attempt
# # letter_hash = {}
# # for char in statement.chars
# #   letter_hash[char] = statement.count(char)
# # end
# # p letter_hash
#
# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
#
# letters.each do |letter|
#   letter_frequency = statement.count(letter)
#   result[letter] = letter_frequency if letter_frequency > 0
# end
#
# p result

# problem 8
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end
# # guess: print 1 and 3, numbers = [2, 4]
# # wrong: 2 gets shifted, not 3, when 3 is printed
# p numbers

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end
# # guess is correct: prints 1 and 2, [1, 2] remains
#
# p numbers

# problem 9
# words = "the flintstones rock"
#
# def titleize(str)
#   capitals = str.split.map { |word| word.capitalize }.join(' ')
# end
#
# p titleize(words)

# problem 10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.each do |name, hash|
#   age = hash["age"]
#   if (0..17).cover?(age)
#     hash["age_group"] = "kid"
#   elsif (18..64).cover?(age)
#     hash["age_group"] = "adult"
#   else
#     hash["age_group"] = "senior"
#   end
# end

# solution with case and range objects:
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters
