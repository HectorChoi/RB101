# plays a game of tic tac toe
# input moves through respective keypad integers (e.g. 7 is top left corner)
# X moves first

def print_board(board)
  puts "#{board[7]}|#{board[8]}|#{board[9]}"
  print_row_line
  puts "#{board[4]}|#{board[5]}|#{board[6]}"
  print_row_line
  puts "#{board[1]}|#{board[2]}|#{board[3]}"
end

def print_row_line
  puts "-+-+-"
end

def three_in_a_row(a, b, c)
  if a == b && a == c && a != " " # if all X's or O's but not blank move
    puts "#{a} wins!"
    a # return the move, which is a truthy value; could be useful for future
  else
    false
  end
end

def victory(board)
  if three_in_a_row(board[7], board[8], board[9]) ||
  three_in_a_row(board[4], board[5], board[6]) ||
  three_in_a_row(board[1], board[2], board[3]) ||
  three_in_a_row(board[7], board[4], board[1]) ||
  three_in_a_row(board[8], board[5], board[2]) ||
  three_in_a_row(board[9], board[6], board[3]) ||
  three_in_a_row(board[7], board[5], board[3]) ||
  three_in_a_row(board[9], board[5], board[1])
    true
  else
    false
  end
end

def full_board(board)
  full = true
  board.each_value do |value|
    full = (value != " ") #check if value is " "
    if !full
      return false
    end
  end
  full # returns true if it reaches here
end

def tie(board)
  if full_board(board) && !victory(board)
    puts "Tie game!"
    return true
  else
    return false
  end
end

def game_over(board)
  victory(board) || tie(board) # returns true if game won or tied, else false
end

board = {
  7 => " ", 8 => " ", 9 => " ",
  4 => " ", 5 => " ", 6 => " ",
  1 => " ", 2 => " ", 3 => " "
}

turn = "X"

until game_over(board)
  print_board(board)
  puts "Enter move (keypad integer 1-9)"
  move = gets.chomp.to_i
  if board[move] == " "
    board[move] = turn
    if turn == "X"
      turn = "O"
    else
      turn = "X"
    end
  else
    puts "Illegal move. Try another."
  end
end
