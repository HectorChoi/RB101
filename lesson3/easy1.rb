# numbers = [1, 2, 2, 3]
# numbers.uniq
#
# puts numbers

# advice = "Few things in life are as important as house training your pet dinosaur."
# advice.gsub!('important', 'urgent')
# p advice

# numbers = [1, 2, 3, 4, 5]
# numbers.delete_at(1)
# p numbers
#
# numbers = [1, 2, 3, 4, 5]
# numbers.delete(1)
# p numbers

# p (10..100).include?(42)
# p (10..100).cover?(42)

# famous_words = "seven years ago..."
# famous_words.prepend('Four score and ')
# # p famous_words
# famous_words = "Four score and " + famous_words
# puts famous_words

# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]
# flintstones.flatten!
# p flintstones

# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3,
# "BamBam" => 4, "Pebbles" => 5 }
# barney = flintstones.select { |k, v| k == "Barney" }
# p barney.to_a.flatten
# p flintstones.assoc("Barney")
