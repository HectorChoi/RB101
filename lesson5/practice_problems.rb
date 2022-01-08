# arr = %w(10 11 9 7 8)
# desc = arr.sort_by do |num_str|
#   -num_str.to_i
# end
#
# desc = arr.sort do |a, b|
#   b.to_i <=> a.to_i
# end

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]
#
# years = books.sort_by do |hash|
#   hash[:published]
# end
#
# p years

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
#
# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
#
# arr3 = [['abc'], ['def'], {third: ['ghi']}]
#
# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
#
# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
#
# p arr1[2][1][3]
# p arr2[1][:third][0]
# p arr3[2][:third][0][0]
# p hsh1['b'][1]
# p hsh2[:third].keys[0]
# p hsh2[:third].key(0)

# arr1 = [1, [2, 3], 4]
#
# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
#
# hsh1 = {first: [1, 2, [3]]}
#
# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
#
# arr1[1][1] += 1
# p arr1
#
# arr2[2] = 4
# p arr2
#
# hsh1[:first][2][0] = 4
# p hsh1
#
# hsh2[['a']][:a][2] = 4
# p hsh2

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# male_munsters = munsters.select do |name, info|
#   info['gender'] == 'male'
# end
#
# male_ages = male_munsters.map do |name, info|
#   info['age']
# end
#
# p male_ages.reduce(:+)

# total_male_age = 0
# munsters.each_value do |details|
#   total_male_age += details['age'] if details['gender'] == 'male'
# end
#
# p total_male_age

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
#
# munsters.each do |name, info|
#   puts "#{name} is a #{info['age']}-year-old #{info['gender']}."
# end

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
# vowels = %w(a e i o u)
#
# hsh.each do |_, arr|
#   arr.each do |str|
#     counter = 0
#     while counter < str.length
#       puts str[counter] if vowels.include?(str[counter])
#       counter += 1
#     end
#   end
# end

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
#
# sorted_desc = arr.map do |sub_arr|
#   sub_arr.sort do |a, b|
#     b <=> a
#   end
# end
#
# p sorted_desc

# arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
#
# plus_one = arr.map do |hash|
#   hash.each_with_object({}) do |(key, value), hash|
#     hash[key] = value + 1
#   end
# end
#
# p plus_one

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
#
# threes = arr.map do |sub_arr|
#   sub_arr.select do |num|
#     num % 3 == 0
#   end
# end
#
# p threes

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# # expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
# my_hash = arr.each_with_object({}) do |sub_arr, hash|
#   hash[sub_arr[0]] = sub_arr[1]
# end
#
# p my_hash

# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
#
# sorted_odds = arr.sort_by do |sub_arr|
#   sub_arr.select do |num|
#     num.odd?
#   end
# end
#
# p sorted_odds
# expected post-sort by odds: [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }
# # expected return value: [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
#
# my_arr = hsh.map do |_, info|
#   if info[:type] == 'fruit'
#     info[:colors].map do |color|
#       color.capitalize
#     end
#   else # vegetable
#     info[:size].upcase
#   end
# end
#
# p my_arr

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
# even_hashes = arr.select do |hash|
#   hash.all? do |_, value_arr|
#     value_arr.all? do |num|
#       num % 2 == 0
#     end
#   end
# end
#
# p even_hashes

# A UUID is a type of identifier often used as a way to uniquely identify
# items...which may not all be created by the same system. That is, without any
# form of synchronization, two or more separate computer systems can create new
# items and label them with a UUID with no significant chance of stepping on
# each other's toes.
#
# It accomplishes this feat through massive randomization. The number of
# possible UUID values is approximately 3.4 X 10E38.
#
# Each UUID consists of 32 hexadecimal characters, and is typically broken
# into 5 sections like this 8-4-4-4-12 and represented as a string.
#
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
#
# Write a method that returns one UUID when called with no parameters.

# first pass - ugly
# def uuid
#   arr1 = []
#   8.times { arr1 << rand(0..15).to_s(16) }
#   arr2 = []
#   4.times { arr2 << rand(0..15).to_s(16) }
#   arr3 = []
#   4.times { arr3 << rand(0..15).to_s(16) }
#   arr4 = []
#   4.times { arr4 << rand(0..15).to_s(16) }
#   arr5 = []
#   12.times { arr5 << rand(0..15).to_s(16) }
#   uuid_arr = []
#   uuid_arr << arr1.join('')
#   uuid_arr << arr2.join('')
#   uuid_arr << arr3.join('')
#   uuid_arr << arr4.join('')
#   uuid_arr << arr5.join('')
#   uuid_arr.join('-')
# end

def generate_UUID
  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += rand(0..15).to_s(16) }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

p generate_UUID
