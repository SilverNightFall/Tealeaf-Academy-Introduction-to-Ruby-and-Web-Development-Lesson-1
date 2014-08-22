blackjack_players = { player_name: "", player_hand: [], dealer_name: "Victoria", dealer_hand: [] }
BLACKJACK_AMOUNT = 21
DEALER_MIN = 17
ACE_VALUE = 11
FACE_CARD_VALUE = 10

def create_shuffled_deck
  ranks = %w{Ace 2 3 4 5 6 7 8 9 10 Jack Queen King}*8
  suits = %w{Spades Hearts Diamonds Clubs}*8
  deck = ranks.product(suits).each do |rank, suit|
  end
  deck.shuffle!
end

def deal_card
  create_shuffled_deck.pop
end

def player_card_value(blackjack_players)
  card_values = 0
  players_cards = blackjack_players[:player_hand].map { |player_cards| player_cards[0]}
  players_cards.each do |player_card|
    if player_card == "Ace"
      card_values += ACE_VALUE
    elsif player_card.to_i == 0
      card_values += FACE_CARD_VALUE
    else
      card_values += player_card.to_i
    end
  end
  players_cards.select { |player_cards| player_cards == "Ace" }.count.times do
    if card_values > BLACKJACK_AMOUNT
      card_values -= FACE_CARD_VALUE
    end
  end
  card_values
end

def dealer_turn(blackjack_players)
  begin
    if dealer_card_value(blackjack_players) < DEALER_MIN
      blackjack_players[:dealer_hand] << deal_card
    end
  end until (dealer_card_value(blackjack_players) > DEALER_MIN || dealer_card_value(blackjack_players) == DEALER_MIN )
  output_winner(blackjack_players)
end

def dealer_card_value(blackjack_players)
  card_values = 0
  dealers_cards = blackjack_players[:dealer_hand].map { |dealer_cards| dealer_cards[0]}
  dealers_cards.each do |dealer_card|
    if dealer_card == "Ace"
      card_values += ACE_VALUE
    elsif dealer_card.to_i == 0
      card_values += FACE_CARD_VALUE
    else
      card_values += dealer_card.to_i
    end
  end
  dealers_cards.select { |dealer_cards| dealer_cards == "Ace" }.count.times do
    if card_values > BLACKJACK_AMOUNT
      card_values -= FACE_CARD_VALUE
    end
  end
  card_values
end

def hit_or_stay(blackjack_players)
  begin
    if ( player_card_value(blackjack_players) == BLACKJACK_AMOUNT || player_card_value(blackjack_players) > BLACKJACK_AMOUNT )
      output_winner(blackjack_players)
    end
    system 'clear'
    puts "#{blackjack_players[:player_name]}, your card total is:"
    p player_card_value(blackjack_players)
    puts ""
    puts "#{blackjack_players[:player_hand]}"
    puts ""
    puts "What would you like to do next?"
    puts ""
    puts "[  HIT ] or [  STAY  ]"
    puts ""
    hit_or_stay = gets.chomp.downcase
    system 'clear'
    if hit_or_stay == "stay"
      if ( player_card_value(blackjack_players) == BLACKJACK_AMOUNT || player_card_value(blackjack_players) > BLACKJACK_AMOUNT )
      output_winner(blackjack_players)
      else
      dealer_turn(blackjack_players)
      end
    elsif hit_or_stay == "hit"
      blackjack_players[:player_hand] << deal_card
    end
  end until ( hit_or_stay == "stay" || player_card_value(blackjack_players) == BLACKJACK_AMOUNT || player_card_value(blackjack_players) > BLACKJACK_AMOUNT )
  output_winner(blackjack_players)
end


def start_game(blackjack_players)
  2.times do
  blackjack_players[:player_hand] << deal_card
  blackjack_players[:dealer_hand] << deal_card
 end
 hit_or_stay(blackjack_players)
end

def welcome_get_name(blackjack_players)
  puts "Welcome to SilverNightFall's Casino"
  puts ""
  puts "Hi, what is your name?"
  puts ""
  STDOUT.flush
  players_name = gets.chomp.capitalize
  blackjack_players[:player_name] = players_name
  system 'clear'
end

def play_blackjack?(blackjack_players)
  blackjack_players[:player_hand] = []
  blackjack_players[:dealer_hand] = []
  puts "#{blackjack_players[:player_name]}, would you like to play a round of Black Jack?"
  puts ""
  puts "[  PLAY ] or [  LEAVE  ]"
  puts ""
  STDOUT.flush
  player_or_leave = gets.chomp.downcase
  puts ""
  if player_or_leave == "leave"
    puts ""
    puts "Maybe another time."
    puts ""
    exit
  else
    start_game(blackjack_players)
  end
end

def output_winner(blackjack_players)
  system 'clear'
  if player_card_value(blackjack_players) == BLACKJACK_AMOUNT
    puts "#{blackjack_players[:player_name]}, congratulations you got Blackjack!"
    puts ""
    if player_card_value(blackjack_players) == dealer_card_value(blackjack_players)
      puts "Its a tie"
    else
      puts "You won!"
    end
  elsif dealer_card_value(blackjack_players) == BLACKJACK_AMOUNT
    puts "#{blackjack_players[:player_name]}, you lose!  Dealer got Blackjack!"
    puts ""
    if player_card_value(blackjack_players) == dealer_card_value(blackjack_players)
      puts "Its a tie"
    else
      puts "Dealer won!"
    end
  elsif ((player_card_value(blackjack_players) > dealer_card_value(blackjack_players)) && player_card_value(blackjack_players) <= BLACKJACK_AMOUNT) || ((player_card_value(blackjack_players) < dealer_card_value(blackjack_players)) && dealer_card_value(blackjack_players) > BLACKJACK_AMOUNT)
    puts "#{blackjack_players[:player_name]}, congratulations you won!"
    puts ""
    if dealer_card_value(blackjack_players) > BLACKJACK_AMOUNT
      puts "Dealer busted!"
    end
  elsif (dealer_card_value(blackjack_players) > player_card_value(blackjack_players)) && dealer_card_value(blackjack_players) < BLACKJACK_AMOUNT
    puts "Dealer won!"
  elsif player_card_value(blackjack_players) == dealer_card_value(blackjack_players)
    puts "It's a tie!"
  elsif player_card_value(blackjack_players) > BLACKJACK_AMOUNT
    puts "#{blackjack_players[:player_name]}, you busted!"
    puts ""
    if dealer_card_value(blackjack_players) > BLACKJACK_AMOUNT
      puts "Dealer busted too"
    elsif dealer_card_value(blackjack_players) < BLACKJACK_AMOUNT
      puts "Dealer won!"
    else
      puts "No Winner!"
    end
  elsif (dealer_card_value(blackjack_players) > BLACKJACK_AMOUNT) && (player_card_value(blackjack_players) > BLACKJACK_AMOUNT)
    puts "#{blackjack_players[:player_name]}, Dealer busted!"
    if
      puts "You busted too"
    else
      puts "Dealer won!"
    end
  else
    puts "Dealer missed something!"
  end
  puts ""
  puts "#{blackjack_players[:player_name]}, your hand is:"
  puts ""
  puts "#{blackjack_players[:player_hand]} Totaling: #{player_card_value(blackjack_players)}"
  puts ""
  puts "Dealers hand:"
  puts ""
  puts "#{blackjack_players[:dealer_hand]} Totaling: #{dealer_card_value(blackjack_players)}"
  puts ""
  play_blackjack?(blackjack_players)
end

welcome_get_name(blackjack_players)
play_blackjack?(blackjack_players)