# create a nested array structure up to the nth row (index n-1)
# take out the n-1 index row in the structure
# sum up elements in the n-1th row
# return sum

def create_rows(num_rows)
  num_nums = 1.upto(num_rows).inject(:+)
  evens = 1.upto(num_nums * 2).select { |num| num % 2 == 0 }

  result = []
  count = 1
  while count <= num_rows
    result << evens.slice!(0, count)
    count += 1
  end
  result
end

p create_rows(4)

def n_row_sum(num)
  rows = create_rows(num)
  rows[num - 1].inject(:+)
end

p n_row_sum(4)
