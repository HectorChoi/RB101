# 1. initialize deck
# 2. deal cards to player and dealer
# 3. player turn: hit or stay
# - repeat until bust or stay
# 4. if player bust, dealer wins.
# 5. dealer turn: hit or stay
# - repeat until total >= 17
# 6. if dealer bust, player wins.
# 7. compare cards and declare winner.

NAMES = {'2'=>'2', '3'=>'3', '4'=>'4', '5'=>'5', '6'=>'6', '7'=>'7', '8'=>'8',
         '9'=>'9', '10'=>'10', 'J'=>'Jack', 'Q'=>'Queen', 'K'=>'King',
         'A'=>'Ace' }
SUITES = ['H', 'S', 'D', 'C']
CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
FACES = ['J', 'Q', 'K']

def initialize_deck
  SUITES.product(CARDS)
end

def deal_card!(deck) # meaningful return value and side effect...
  deck.delete(deck.sample)
end

def total(hand)
  values = hand.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value.to_i.to_s == value
      sum += value.to_i
    elsif FACES.include?(value)
      sum += 10
    else # an ace
      sum += 11
    end
  end

  # correct for Aces over 21
  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end


def display_dealer_card(dealer_hand)
  puts "Dealer has: #{NAMES[dealer_hand[0][1]]} and unknown card"
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

def display_player_cards(player_hand)
  player_values = player_hand.map { |card| NAMES[card[1]] }
  puts "You have: #{joinand(player_values)}"
end

def display_dealer_cards(dealer_hand)
  dealer_values = dealer_hand.map { |card| NAMES[card[1]] }
  puts "Dealer has: #{joinand(dealer_values)}"
end

def busted?(hand)
  total(hand) > 21
end

def who_won?(dealer_hand, player_hand)
  if total(dealer_hand) > total(player_hand)
    'Dealer'
  elsif total(player_hand) > total(dealer_hand)
    'Player'
  else
    'Tie'
  end
end

def display_result(result)
  case result
  when 'Dealer' then puts "Dealer wins!"
  when 'Player' then puts "Player wins!"
  else
    puts "It's a tie!"
  end
end

dealer_hand = []
player_hand = []

deck = initialize_deck

2.times do
  dealer_hand << deal_card!(deck)
  player_hand << deal_card!(deck)
end

display_dealer_card(dealer_hand)
display_player_cards(player_hand)

loop do
  puts "Do you want to hit (h) or stay (s)?"
  answer = gets.chomp
  break if %w(s stay).include?(answer)
  if %w(h hit).include?(answer)
    player_hand << deal_card!(deck)
    display_player_cards(player_hand)
  else
    puts "Invalid response. Please type 'h' or 'hit' to hit, 's' or 'stay' to stay."
  end
  break if busted?(player_hand)
end

if busted?(player_hand)
  puts "You have busted and the dealer wins!"
else
  puts "You chose to stay and your hand total is #{total(player_hand)}."

  display_dealer_cards(dealer_hand)

  until total(dealer_hand) >= 17
    puts "The dealer hits."
    dealer_hand << deal_card!(deck)
    display_dealer_cards(dealer_hand)
  end

  if busted?(dealer_hand)
    puts "The dealer has busted and you win!"
  else
    puts "The dealer stays and their hand total is #{total(dealer_hand)}."
    result = who_won?(dealer_hand, player_hand)
    display_result(result)
  end
end
