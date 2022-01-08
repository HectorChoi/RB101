arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
#
sorted_arr = arr.sort_by { |sub_arr| sub_arr.map(&:to_i) }
#
p sorted_arr

# def remove_evens!(arr)
#   cloned_arr = arr.dup
#   cloned_arr.each do |num|
#     if num % 2 == 0
#       arr.delete(num)
#     end
#   end
#   arr
# end
#
# p remove_evens!([1, 1, 2, 3, 4, 6, 8, 9])
