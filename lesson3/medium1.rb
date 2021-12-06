# Question 1 first pass
# 10.times do |index|
#   string = ""
#   index.times { |_| string << " " }
#   string << "The Flintstones Rock!"
#   puts string
# end

# 10.times { |number| puts ((" " * number) + "The Flintstones Rock!") }

# Q2
# puts "the value of 40 + 2 is " + (40 + 2).to_s
# puts "the value of 40 + 2 is #{40 + 2}"

# Q3
# def factors(number)
#   divisor = number
#   factors = []
#   while divisor > 0 do
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end
#   factors
# end
#
# puts factors(0)

# Q4
# rolling_buffer1 changes the input buffer, rolling_buffer2 does not alter the
# input argument

# Q5
# You must pass in the limit variable as an argument to the method
# (it is not available in the method definition scope otherwise)

# Q6
# 34 (mess_with_it reassigns and returns +8, but cannot change answer when
# it is passed in as an argument)

# Q7
# Yes, the family's data did get ransacked - the program uses the hash
# passed in as an argument on the .each call instead of reassigning it to a
# new variable

# Q8
# def rps(fist1, fist2)
#   if fist1 == 'rock'
#     (fist2 == 'paper') ? 'paper' : 'rock'
#   elsif fist1 == 'paper'
#     (fist2 == 'scissors') ? 'scissors' : 'paper'
#   else
#     (fist2 == 'rock') ? 'rock' : 'scissors'
#   end
# end
#
# puts rps(rps(rps('rock', 'paper'), rps('rock', 'scissors')), 'rock')
# outputs paper

# Q9
# def foo(param = 'no')
#   'yes'
# end
#
# def bar(param = 'no')
#   param == 'no' ? 'yes' : 'no'
# end
#
# puts bar(foo) # outputs 'no'
