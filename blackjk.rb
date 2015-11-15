#The deck has 52 cards
#Player is dealt 2 cards
#Dealer is dealt 2 cards
#Players cards are both faceing up
#Dealers card has on facing up and one hidden
#Cards 2-9 are worth face value
#there are 32 face cards in deck
#Suite cards and 10 are worth 10
#There are 16 cards worth 10 in a deck
#Aces are worth 1 or 11
#there are 4 aces in a deck
#Player to get closest to 21 without going over wins
#Tie if both players have 21
#Player can ask for additional cards "Hits"
#If dealer has 16, he must "hit"
#if dealer has 17, must "stand"
#when cards are used, they are removed from the deck



# enter name of players
# get name of players

# Shall the dealer deal
# dealer deals

# player gets two cards
# both cards are showing
# is the player_sum of both cards equal to 21
# if yes, Player wins
# if no, save value

# deal gets two cards
# one card is showing
# one card is hidden

# Does player want to hit or stand?
# Hit or Stand?
# if hit player gets card
# if player_sum is 21 player stand
# if player_sum is greater than 21
# puts "You lose"
# if player_sum is less than 21 ask does player want to Hit or Stand
# if Stand save value to memory go to deal

# If Player Stand Dealer shows hidden card
# Hidden card value showing
# Sum of 2 cards
# save to memory
# If dealer_sum is 17 or greater, dealer stands
# If dealer_sum is < or = to 16 Dealer hits
# If dealer_sum is greater than 16 but less than 22 dealer stands
# if deal_sum is greater than 21, dealer loses

# if player_sum is greater than dealer_sum
	# puts "you win"
# if dealer_sum is greater than player_sum
	# puts "You lose"
# if player_sum is = dealer_sum
	# puts "Push"
# end

# Play again?
# if yes deal cards
# elseif
# end

def calculate_total(cards) 
  # [['H', '3'], ['S', 'Q'], ... ]
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for Aces
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

def calculate_total(cards) 
# [['H', '3'], ['S', 'Q'], ... ]

end

puts "Welcome to Blackjack!"

suits = ['H', 'D', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!

# Deal Cards

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)

# Show Cards

puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
puts "You have: #{mycards[0]} and #{mycards[1]}, for a total of: #{mytotal}"
puts ""

# Player turn
if mytotal == 21
  puts "Congratulations, you hit blackjack! You win!"
  exit
end

while mytotal < 21
  puts "What would you like to do? 1) hit 2) stay"
  hit_or_stay = gets.chomp

  if !['1', '2'].include?(hit_or_stay)
    puts "Error: you must enter 1 or 2"
    next
  end

  if hit_or_stay == "2"
    puts "You chose to stay."
    break
  end

  #hit
  new_card = deck.pop
  puts "Dealing card to player: #{new_card}"
  mycards << new_card
  mytotal = calculate_total(mycards)
  puts "Your total is now: #{mytotal}"

  if mytotal == 21
    puts "Congratulations, you hit blackjack! You win!"
    exit
  elsif mytotal > 21
    puts "Sorry, it looks like you busted!"
    exit
  end
end

# Dealer turn

if dealertotal == 21
  puts "Sorry, dealer hit blackjack. You lose."
  exit
end

while dealertotal < 17
  #hit
  new_card = deck.pop
  puts "Dealing new card for dealer: #{new_card}"
  dealercards << new_card
  dealertotal = calculate_total(dealercards)
  puts "Dealer total is now: #{dealertotal}"

  if dealertotal == 21
    puts "Sorry, dealer hit blackjack. You lose."
    exit
  elsif dealertotal > 21
    puts "Congratulations, dealer busted! You win!"
    exit
  end
end

# Compare hands

puts "Dealer's cards: "
dealercards.each do |card|
  puts "=> #{card}"
end
puts ""

puts "Your cards:"
mycards.each do |card|
  puts "=> #{card}"
end
puts ""

if dealertotal > mytotal
  puts "Sorry, dealer wins."
elsif dealertotal < mytotal
  puts "Congratulations, you win!"
else
  puts "It's a tie!"
end
