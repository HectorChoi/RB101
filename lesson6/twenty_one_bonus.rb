require 'yaml'

LIMIT_NUMBER = 21
DEALER_LIMIT = 17
NAMES = { '2' => '2', '3' => '3', '4' => '4', '5' => '5', '6' => '6',
          '7' => '7', '8' => '8', '9' => '9', '10' => '10', 'J' => 'Jack',
          'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace' }
SUITS = ['H', 'S', 'D', 'C']
CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
MESSAGES = YAML.load_file('twenty_one_messages.yml')

def prompt(key, custom_data='')
  message = format(MESSAGES[key], custom_data: custom_data)
  puts "=> #{message}"
end

def total(hand)
  values = hand.map { |card| card[0] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0 # face card
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.size.times do
    sum -= 10 if sum > LIMIT_NUMBER
  end

  sum
end

def busted?(hand_total)
  hand_total > LIMIT_NUMBER
end

def joinand(arr, delimiter=', ', word='and')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def format_cards(hand)
  card_values = hand.map { |card| NAMES[card[0]] }
  joinand(card_values)
end

def play_again?
  loop do
    prompt('play_again')
    answer = gets.chomp.downcase
    return answer.start_with?('y') if %w(y yes n no).include?(answer)
    prompt('invalid_play_again')
  end
end

def calculate_result(player_total, dealer_total)
  if player_total > LIMIT_NUMBER
    :player_busted
  elsif dealer_total > LIMIT_NUMBER
    :dealer_busted
  elsif player_total > dealer_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(player_total, dealer_total)
  result = calculate_result(player_total, dealer_total)

  case result
  when :player_busted then prompt('player_busted')
  when :dealer_busted then prompt('dealer_busted')
  when :player then prompt('player_win')
  when :dealer then prompt('dealer_win')
  when :tie then prompt('tie')
  end
end

player_wins = 0
dealer_wins = 0

# main loop
loop do
  system 'clear'
  prompt('welcome')

  deck = CARDS.product(SUITS).shuffle
  player_hand = []
  dealer_hand = []

  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end

  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  prompt('dealer_hide_hand', format_cards([dealer_hand[0]]))

  # player loop
  loop do
    prompt('player_hand', format_cards(player_hand))

    player_move = nil

    loop do
      prompt('hit_or_stay')
      player_move = gets.chomp.downcase
      break if %w(h hit s stay).include?(player_move)
      prompt('invalid_move')
    end

    if %w(h hit).include?(player_move)
      player_hand << deck.pop
      player_total = total(player_hand)
      prompt('hit', format_cards([player_hand[-1]]))
    end

    break if %w(s stay).include?(player_move) || busted?(player_total)
  end

  if busted?(player_total)
    dealer_wins += 1
    break prompt('dealer_match_winner') if dealer_wins == 5
    display_result(player_total, dealer_total)
    play_again? ? next : break
  else
    prompt('player_stay_total', player_total)
  end

  # dealer loop
  loop do
    prompt('dealer_hand', format_cards(dealer_hand))
    break if dealer_total >= DEALER_LIMIT
    dealer_hand << deck.pop
    dealer_total = total(dealer_hand)
    prompt('dealer_hit', format_cards([dealer_hand[-1]]))
  end

  if busted?(dealer_total)
    player_wins += 1
    display_result(player_total, dealer_total)
    break prompt('player_match_winner') if player_wins == 5
    play_again? ? next : break
  else
    prompt('dealer_stay_total', dealer_total)
  end

  # both player and dealer stay - compare hands!
  prompt('compare_hands')
  result = calculate_result(player_total, dealer_total)
  if result == :dealer_busted || result == :player
    player_wins += 1
  elsif result == :player_busted || result == :dealer
    dealer_wins += 1
  end
  display_result(player_total, dealer_total)

  break prompt('player_match_winner') if player_wins == 5
  break prompt('dealer_match_winner') if dealer_wins == 5
  break unless play_again?
end
