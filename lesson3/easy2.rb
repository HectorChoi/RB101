# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# p ages.key?("Spot")

# munsters_description = "The Munsters are creepy in a good way."
# p munsters_description.swapcase
# p munsters_description.capitalize
# p munsters_description.downcase
# p munsters_description.upcase

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }
#
# ages.merge!(additional_ages)
# p ages

# advice = "Few things in life are as important as house training your pet dinosaur."
# p advice =~ /Dino/
# p advice.include?("Dino")
# p advice.match?("Dino")

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.append("Dino", "Hoppy")
# flintstones << "Dino"
# p flintstones
# flintstones.push("Dino").push("Hoppy")
# p flintstones
# flintstones.concat(%w(Dino Hoppy))
# p flintstones

# advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.slice!("Few things in life are as important as ")
# p advice.slice!(0, advice.index('house'))
# p advice

# statement = "The Flintstones Rock!"
# t_count = statement.count('t')
# p t_count

# title = "Flintstone Family Members"
# p title.center(40)
