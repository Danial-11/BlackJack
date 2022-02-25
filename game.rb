# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)
require_relative 'deck'

deck = Deck.new
deck.shuffle

player_hand = []
dealer_hand = []

puts 'Welcome to BLACK JACK GAME'
2.times do
  player_hand << deck.take
  dealer_hand << deck.take
end
player_total = player_hand.inject(0) { |sum, rank| sum + rank.value }
dealer_total = dealer_hand.inject(0) { |sum, rank| sum + rank.value }

if player_total == 21
  puts player_hand, dealer_hand
  puts 'You win!'
  exit
elsif dealer_total == 21
  puts 'you lost and dealer won!'
  exit
else
  puts "Dealer's one card is facedown. other card is #{dealer_hand[0]}"
  puts 'your cards are: '
  puts player_hand
  puts "You total score is #{player_total}"
  puts 'you want to hit or pass?'
  hit_pass = gets.chomp

  if hit_pass.upcase == 'H'
    player_hand << deck.take
    puts player_hand
    player_total = player_hand.inject(0) { |sum, rank| sum + rank.value }
    puts player_total
    if player_total > 21
      puts 'player busted'
      exit
    elsif player_total == 21
      puts 'you win'
      exit
    else
      puts 'you want to hit or pass?'
      hit_pass = gets.chomp
      if hit_pass.upcase == 'H'
        player_hand << deck.take
        puts player_hand
        player_total = player_hand.inject(0) { |sum, rank| sum + rank.value }
        puts "Player's total score: #{player_total}"
        if player_total > 21
          puts 'you busted so lost'
          exit
        end
      elsif hit_pass.upcase != 'H'
        puts
      end
    end
  elsif hit_pass.upcase != 'H'
    puts
  end
end

while dealer_total < 17 do
  dealer_hand << deck.take
  dealer_total = dealer_hand.inject(0) { |sum, rank| sum + rank.value }
  if dealer_total > 21
    puts 'dealer cards:'
    puts dealer_hand
    puts 'Dealer busted, You won!'
  else
    puts
  end
end

if player_total > dealer_total
  puts 'Player cards:'
  puts player_hand
  puts 'Dealer cards:'
  puts dealer_hand
  if player_total <= 21
    puts 'Player won'
  else
    puts 'Player busted'
  end
elsif dealer_total > player_total
  puts 'Player cards: '
  puts player_hand
  puts 'Dealer cards:'
  puts dealer_hand
  if dealer_total <= 21
    puts 'Dealer won!'
  else
    puts 'Dealer busted!'
    exit
  end
else
  puts 'Player cards: '
  puts player_hand
  puts 'Dealer cards:'
  puts dealer_hand
  puts 'Its Tie'
  exit
end
