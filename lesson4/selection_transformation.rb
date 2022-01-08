# def select_fruit(produce)
#   produce.select { |k, v| v == 'Fruit' }
# end

# def select_fruit(produce)
#   keys = produce.keys
#   counter = 0
#   fruit_hash = Hash.new
#
#   loop do
#     # this has to be at the top in case if produce_list is empty hash
#     break if counter == keys.size
#
#     if produce[keys[counter]] == 'Fruit'
#       fruit_hash[keys[counter]] = 'Fruit'
#     end
#     counter += 1
#
#   end
#   fruit_hash
# end
#
# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }
#
#
# p select_fruit(produce)

# def double_numbers(numbers)
#   doubled_numbers = []
#   counter = 0
#
#   loop do
#     break if counter == numbers.size
#
#     current_number = numbers[counter]
#     doubled_numbers << current_number * 2
#
#     counter += 1
#   end
#
#   doubled_numbers
# end
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers(my_numbers)

# def double_numbers!(numbers)
#   counter = 0
#
#   loop do
#     break if counter == numbers.size
#
#     numbers[counter] = numbers[counter] * 2
#
#     counter += 1
#   end
#
#   numbers
# end
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers!(my_numbers)
# p my_numbers

# def double_odd_numbers(numbers)
#   doubled_numbers = []
#   counter = 0
#
#   loop do
#     break if counter == numbers.size
#
#     current_number = numbers[counter]
#     current_number *= 2 if current_number.odd?
#     doubled_numbers << current_number
#
#     counter += 1
#   end
#
#   doubled_numbers
# end
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_numbers(my_numbers)
# p my_numbers

# def double_odd_index_numbers(numbers)
#   doubled_numbers = []
#   counter = 0
#
#   loop do
#     break if counter == numbers.size
#
#     current_number = numbers[counter]
#     current_number *= 2 if counter.odd?
#     doubled_numbers << current_number
#
#     counter += 1
#   end
#
#   doubled_numbers
# end
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_index_numbers(my_numbers)

# def general_select(produce_list, selection_criteria)
#   produce_keys = produce_list.keys
#   counter = 0
#   selected_produce = {}
#
#   loop do
#     break if counter == produce_keys.size
#
#     current_key = produce_keys[counter]
#     current_value = produce_list[current_key]
#
#     if current_value == selection_criteria
#       selected_produce[current_key] = current_value
#     end
#
#     counter += 1
#   end
#
#   selected_produce
# end
#
# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }
#
# p general_select(produce, 'Fruit')
# p general_select(produce, 'Vegetable')
# p general_select(produce, 'Meat')

# def multiply(num_array, multiplier)
#   multiplied = []
#   counter = 0
#
#   loop do
#     break if counter == num_array.size
#
#     multiplied << num_array[counter] * multiplier
#     counter += 1
#   end
#
#   multiplied
# end
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# p multiply(my_numbers, 3)

def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end

question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a').size
