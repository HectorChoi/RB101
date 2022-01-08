def palindrome_substrings(str)
  result = []
  substr_arr = substrings(str)
  substr_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

def substrings(str)
  result = []
  starting_index = 0

  while starting_index <= str.length - 2
    num_chars = 2

    while num_chars <= str.length - starting_index
      result << str[starting_index, num_chars]
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

p palindrome_substrings('abcddcbA')
p palindrome_substrings('supercalifragilisticexpialidocious')
p palindrome_substrings('palindrome')
