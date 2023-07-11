SUITES = %w(H S D C)
SYM = {'H' => "\u2665", 'S' => "\u2660", 'D' => "\u2666", 'C' => "\u2663"}
NUMBERS = %w(1 2 3 4 5 6 7 8 9 10 J Q K A)
VALUES = {'1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9, '10'=> 10,'J'=> 10, 'Q'=> 10, 'K'=> 10} # Ace not included; see update_total function

# HAND : [[SYMBOL , NUMBER], [SYMBOL , NUMBER]]

# things to add : charlie rule (7 card drawn) and show up to 7 cards drawn

def prompt(str)
  puts "=> #{str}"
end

def display_player_hand(p, total, name) # p = player_hand ; s = symbols ;
  a = p[0]
  b = p[1]
  c = p[2] ? p[2] : ['▒','▒']
  d = p[3] ? p[3] : ['▒','▒']
  puts "                        #{name}'s hand"
  puts "╔-------------┐╔-------------┐╔-------------┐╔-------------┐"
  puts "|#{a[1]}            ||#{b[1]}            ||#{c[1]}            ||#{d[1]}            |"
  puts "|             ||             ||             ||             |"
  puts "|             ||             ||             ||             |"
  puts "|      #{SYM[a[0]]}      ||      #{SYM[b[0]]}      ||      #{SYM[c[0]] || '▒' }      ||      #{SYM[d[0]] || '▒'}      |"
  puts "|             ||             ||             ||             |"
  puts "|             ||             ||             ||             |"
  puts "|            #{a[1]}||            #{b[1]}||            #{c[1]}||            #{d[1]}|"
  puts "└-------------╝└-------------╝└-------------╝└-------------╝"
  puts "Your hand count: #{total}"
end

def display_dealer_hand(d, total) # p = player_hand ; s = symbols ;
  system 'clear'
  a = d[0]
  b = d[1] ? d[1] : ['▒','▒']
  c = d[2] ? d[2] : ['▒','▒']
  d = d[3] ? d[3] : ['▒','▒']
  puts "                        Dealer's hand"
  puts "╔-------------┐╔-------------┐╔-------------┐╔-------------┐"
  puts "|#{a[1]}            ||#{b[1]}            ||#{c[1]}            ||#{d[1]}            |"
  puts "|             ||             ||             ||             |"
  puts "|             ||             ||             ||             |"
  puts "|      #{SYM[a[0]]}      ||      #{SYM[b[0]] || '▒' }      ||      #{SYM[c[0]] || '▒'}      ||      #{SYM[d[0]] || '▒'}      |"
  puts "|             ||             ||             ||             |"
  puts "|             ||             ||             ||             |"
  puts "|            #{a[1]}||            #{b[1]}||            #{c[1]}||            #{d[1]}|"
  puts "└-------------╝└-------------╝└-------------╝└-------------╝"
  puts "Dealer's hand count: #{total}"
end

def initialize_deck
  new_deck = []
  SUITES.each do |suite|
    NUMBERS.each do |num|
      new_deck << [suite, num]
    end
  end
  new_deck.shuffle
end

def deal_hands!(deck, player, dealer)
  2.times do |_|
    player << deck.delete(deck.first)
    dealer << deck.delete(deck.first)
  end
end

def hit_player!(deck, player)
  player << deck.delete(deck.first)
end

def hit_dealer!(deck, dealer)
  dealer << deck.delete(deck.first)
end

def busted?(total)
 total > 21 ? true : false
end

def twentyone?(total)
  total == 21 ? true : false
end

def within_twentyone?(total)
 total < 21 ? true : false
end

def update_total(hand) # returns value of hand total
  number_of_aces = 0
  total = 0

  hand.each do |card|
    if card[1] == 'A'
      number_of_aces += 1
    else
      total += VALUES[card[1]]
    end
  end
  
  number_of_aces.times do |_|
    if total <= 10
      total += 11
    else
      total += 1
    end
  end
  total
end

def player_choice(input)
  case input
  when '1' then return true
  when '2' then return false
  end
end

def sweet_spot?(total)
  (total >= 17 && total <= 21) ? true : false
end

def dealer_wins?(player_total, dealer_total)
  if sweet_spot?(dealer_total) && (dealer_total > player_total)
    true
  elsif within_twentyone?(dealer_total) && busted?(player_total)
    true
  else
    false
  end
end

def player_wins?(player_total, dealer_total)
  if twentyone?(player_total) && sweet_spot?(dealer_total)
    true
  elsif within_twentyone?(player_total) && busted?(dealer_total)
    true
  else
    false
  end
end

def draw?(player_total, dealer_total)
  if busted?(player_total) && busted?(dealer_total)
    true
  elsif player_total == dealer_total
    true
  else
    false
  end
end

def display_standings(player_total, dealer_total, user_name)
  if dealer_wins?(player_total, dealer_total)
    prompt "The house wins!"
  elsif player_wins?(player_total, dealer_total)
    prompt "#{user_name} wins!"
  elsif draw?(player_total, dealer_total)
    prompt "It's a draw!"
  end
end

prompt "Welcome to Blackjack! What is your name?"
user_name = gets.chomp

# game loop
loop do
  deck = initialize_deck # we should randomize the order of the deck once and final
  player_hand = []
  player_total = 0
  dealer_hand = []
  dealer_total = 0


  # Initialize Game
  deal_hands!(deck, player_hand, dealer_hand)
  p dealer_hand
  hidden_card = dealer_hand.delete(dealer_hand.last)
  p dealer_hand
  player_total = update_total(player_hand)
  dealer_total = update_total(dealer_hand)
  display_dealer_hand(dealer_hand, dealer_total)
  display_player_hand(player_hand, player_total, user_name)

  if twentyone?(player_total)
    prompt "Blackjack! It's not over yet. Let's reveal the dealer's cards."
    prompt "Press enter to continue."
    gets.chomp
  else
    prompt "Would you like to: (1) Hit or (2) Stand"
    while player_choice(gets.chomp)
      hit_player!(deck, player_hand)
      player_total = update_total(player_hand)
      display_dealer_hand(dealer_hand, dealer_total)
      display_player_hand(player_hand, player_total, user_name)
      
      prompt "The dealer hit you with a card!"

      if busted?(player_total)
        prompt "It's a bust! You lose. Let's reveal the dealer's cards."
        prompt "Press enter to continue."
        gets.chomp
        break
      elsif twentyone?(player_total)
        prompt "Blackjack! It's not over yet. Let's reveal the dealer's cards."
        prompt "Press enter to continue."
        gets.chomp
        break
      else
        prompt "Would you like to: (1) Hit or (2) Stand"
      end
    end
  end

  loop do
    if dealer_hand.size == 1
      dealer_hand << hidden_card
      dealer_total = update_total(dealer_hand)
      display_dealer_hand(dealer_hand, dealer_total)
      display_player_hand(player_hand, player_total, user_name)
      prompt "The dealer revealed their second card."
      prompt "Press enter to continue."
      gets.chomp
      break if busted?(player_total)
    else
      hit_dealer!(deck, dealer_hand)
      dealer_total = update_total(dealer_hand)
      display_dealer_hand(dealer_hand, dealer_total)
      display_player_hand(player_hand, player_total, user_name)
      prompt "The dealer drew a new card from the deck."
      prompt "Press enter to continue."
      gets.chomp
    end
    break if dealer_wins?(player_total, dealer_total) || player_wins?(player_total, dealer_total) || draw?(player_total, dealer_total)
  end

  display_dealer_hand(dealer_hand, dealer_total)
  display_player_hand(player_hand, player_total, user_name)
  display_standings(player_total, dealer_total, user_name)

prompt "Would you like to play another round? (Y/n)"
break unless gets.chomp.downcase.start_with?('y')

end

prompt "Thank you for playing Blackjack, #{user_name}!"