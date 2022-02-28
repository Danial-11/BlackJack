# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)
require_relative 'deck'

module Hello
  def player_total(player_hand)
    player_hand.inject(0) { |sum, rank| sum + rank.value }
  end

  def dealer_total(dealer_hand)
    dealer_hand.inject(0) { |sum, rank| sum + rank.value }
  end
end
# class game

class Game
  include Hello
  deck = Deck.new
  deck.shuffle

  player_hand = []
  dealer_hand = []

  puts 'Welcome to BLACK JACK GAME'
  2.times do
    player_hand << deck.take
    dealer_hand << deck.take
  end

  if Game.new.player_total(player_hand) == 21
    puts 'Player cards:'
    puts player_hand
    puts 'Dealer cards:'
    puts dealer_hand
    puts 'You win!'
    exit
  elsif Game.new.player_total(player_hand) > 21
    puts 'Player Total'
    puts player_hand, Game.new.player_total(player_hand)
    puts 'Player Busted!'
    exit
  elsif Game.new.dealer_total(dealer_hand) == 21
    puts 'Player cards:'
    puts player_hand
    puts 'Dealer cards:'
    puts dealer_hand
    puts 'you lost and dealer won!'
    exit
  else
    puts "Dealer's one card is facedown. other card is #{dealer_hand[0]}"
    puts 'your cards are: '
    puts player_hand
    puts "You total score is #{Game.new.player_total(player_hand)}"
    puts 'you want to hit or pass?'
    hit_pass = gets.chomp
    if hit_pass.casecmp('H').zero?
      player_hand << deck.take
      puts player_hand
      Game.new.player_total(player_hand)
      puts Game.new.player_total(player_hand)
      if Game.new.player_total(player_hand) > 21
        puts 'player busted'
        exit
      elsif Game.new.player_total(player_hand) == 21
        puts 'you win'
        exit
      else
        puts 'you want to hit or pass?'
        hit_pass = gets.chomp
        if hit_pass.casecmp('H').zero?
          player_hand << deck.take
          puts player_hand
          Game.new.player_total(player_hand)
          puts "Player's total score: #{Game.new.player_total(player_hand)}"
          if Game.new.player_total(player_hand) > 21
            puts 'you busted so lost'
            exit
          end
        else
          puts
        end
      end
    else
      puts
    end
  end

  while Game.new.dealer_total(dealer_hand) < 17
    dealer_hand << deck.take
    Game.new.dealer_total(dealer_hand)
    if Game.new.dealer_total(dealer_hand) > 21
      puts 'dealer cards:'
      puts dealer_hand
      puts 'Dealer busted, You won!'
    else
      puts
    end
  end

  if Game.new.player_total(player_hand) > Game.new.dealer_total(dealer_hand)
    puts 'Player cards:'
    puts player_hand
    puts 'Dealer cards:'
    puts dealer_hand
    if Game.new.player_total(player_hand) <= 21
      puts 'Player won'
    else
      puts 'Player busted'
    end
  elsif Game.new.dealer_total(dealer_hand) > Game.new.player_total(player_hand)
    puts 'Player cards: '
    puts player_hand
    puts 'Dealer cards:'
    puts dealer_hand
    if Game.new.dealer_total(dealer_hand) <= 21
      puts 'Dealer won!'
    else
      puts
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
end
