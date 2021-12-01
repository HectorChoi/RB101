# Bonus features to add to rock paper scissors program:
# 1. Lizard Spock - add Lizard and Spock as plays to the program
# 2. Allow for abbreviations (e.g. "r" for "rock") as inputs
# 3. Keep score of the player's and computer's wins.
# When either the player or computer reaches three wins, the match is over.

require 'yaml'
MESSAGES = YAML.load_file('rps_bonus_messages.yml')

VALID_MOVES = %w(rock paper scissors lizard spock)
VALID_INPUT = { 'r' => 'rock', 'rock' => 'rock', 'p' => 'paper',
                'paper' => 'paper', 'sc' => 'scissors',
                'scissors' => 'scissors', 'l' => 'lizard', 'lizard' => 'lizard',
                'sp' => 'spock', 'spock' => 'spock' }
WINNING_MOVES = { 'rock' => ['lizard', 'scissors'],
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'lizard' => ['paper', 'spock'],
                  'spock' => ['rock', 'scissors'] }

def prompt(key, custom_data1='', custom_data2='')
  message = format(MESSAGES[key], custom_data1: custom_data1, custom_data2:
  custom_data2)
  puts "=> #{message}"
end

def get_move
  loop do
    prompt('valid_input')
    move = gets.chomp.downcase
    if VALID_INPUT.keys.include?(move)
      return VALID_INPUT[move]
    else
      prompt('input_error')
    end
  end
end

def win?(first, second)
  WINNING_MOVES[first].include?(second)
end

def display_results(player_move, computer_move)
  prompt('moves', player_move, computer_move)
  if win?(player_move, computer_move)
    prompt('player_win_round')
  elsif win?(computer_move, player_move)
    prompt('computer_win_round')
  else
    prompt('tie_round')
  end
end

def update_score(current_score, player_move, computer_move)
  if win?(player_move, computer_move)
    current_score[0] += 1
  elsif win?(computer_move, player_move)
    current_score[1] += 1
  end
end

score = [0, 0] # index 0 is player's win total; index 1 is computer's win total

prompt('welcome')
loop do
  player_move = get_move
  computer_move = VALID_MOVES.sample

  display_results(player_move, computer_move)
  update_score(score, player_move, computer_move)

  if score[0] == 3
    prompt('player_win_match')
    break
  elsif score[1] == 3
    prompt('computer_win_match')
    break
  end
end

prompt('thank_you')
