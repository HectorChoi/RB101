def biggest_number(numbers)
  return("Empty collection of numbers!") if numbers.empty?
  saved_number = numbers[0]

  numbers.each do |number|
    # current_number = number # redundant TL of pseudocode, just use number variable itself
    if saved_number >= number
      next
    else
      saved_number = number
    end
  end

  saved_number
end

p biggest_number([0, 10, 12, 5, 3, 20, 18])
