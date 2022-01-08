p 'A' <=> 'a'
p '!' <=> 'A'
p 'b'.ord
p '}'.ord
p 'b' <=> '}'
# uppercase letters come before lowercase letters
# digits and most punctuation come before letters
# there is an extended ASCII table containing accented and otehr characters
# which comes after the main ASCII table

a = %w(ashe braum caitlyn)
p a.minmax

p a.sort_by { |name| name[1] }
