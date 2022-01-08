# [1, 2, 3].each do |num|
#   puts num
# end

# hash = { a: 1, b: 2, c: 3 }
#
# hash.each do |key, value|
#   puts "The key is #{key} and the value is #{value}"
# end

odds = [1, 2, 3].select do |num|
  num.odd?
end

p odds
