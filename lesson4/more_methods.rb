# arr = { a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
#   array << pair.last
# end
#
# p arr

# my_hash = { a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
#   hash[value] = key
# end
#
# p my_hash

# p [1, 2, 3].first(2)

# p ({ a: "ant", b: "bear", c: "cat" }.first(2))

# arr = [1, 2, 3].partition do |num|
#   num.odd?
# end
#
# odd, even = [1, 2, 3].partition do |num|
#   num.odd?
# end
#
# p odd

# long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
#   value.size > 3
# end
#
# p long
# p short
#
# p long.to_h
