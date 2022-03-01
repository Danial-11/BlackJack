# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)
require_relative 'deck'
require_relative 'module'

# class game

class Game
  game = Game.new
  include Meths
  deck = Deck.new
  deck.shuffle

  player_hand = []
  dealer_hand = []

  puts 'Welcome to BLACK JACK GAME'
  2.times do
    player_hand << deck.take
    dealer_hand << deck.take
  end

  if game.player_total(player_hand) == 21
    puts "Player cards:\n#{player_hand.join("\n")}\nDealer cards: \n#{dealer_hand.join("\n")} \n You win "
    exit
  elsif game.player_total(player_hand) > 21
    puts "Player cards:\n#{player_hand.join("\n")}\nPlayer Score: \n#{game.player_total(player_hand)} \nPlayer busted!"
    exit
  elsif game.dealer_total(dealer_hand) == 21
    puts "Player cards:\n#{player_hand.join("\n")}\nDealer cards:\n#{dealer_hand.join("\n")}\nDealer wins!"
    exit
  else
    puts "Dealer's one card is facedown. other card is #{dealer_hand[0]}"
    puts "Player cards:\n#{player_hand.join("\n")}\nPlayer score: #{game.player_total(player_hand)}"
    puts "press 'h' for hit or any key for pass!"
    hit_pass = gets.chomp

    if hit_pass.casecmp('H').zero?
      player_hand << deck.take
      puts player_hand
      game.player_total(player_hand)
      puts game.player_total(player_hand)
      if game.player_total(player_hand) > 21
        puts 'player busted'
        exit
      elsif game.player_total(player_hand) == 21
        puts 'you win'
        exit
      else
        puts "press 'h' for hit or any key for pass!"
        hit_pass = gets.chomp
        if hit_pass.casecmp('H').zero?
          player_hand << deck.take
          puts player_hand
          game.player_total(player_hand)
          puts "Player's total score: #{game.player_total(player_hand)}"
          if game.player_total(player_hand) > 21
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
  while game.dealer_total(dealer_hand) < 17
    dealer_hand << deck.take
    game.dealer_total(dealer_hand)
    if game.dealer_total(dealer_hand) > 21
      puts "Dealer cards:\n#{dealer_hand.join("\n")}\nDealer Busted!\n"
    else
      puts
    end
  end

  if game.player_total(player_hand) > game.dealer_total(dealer_hand)
    puts "Player cards:\n#{player_hand.join("\n")}\nDealer cards:\n#{dealer_hand.join("\n")}"
    if game.player_total(player_hand) <= 21
      puts 'Player won'
    else
      puts 'Player busted'
    end
  elsif game.dealer_total(dealer_hand) > game.player_total(player_hand)
    puts "Player cards:\n#{player_hand.join("\n")} \nDealer cards:\n#{dealer_hand.join("\n")}"
    if game.dealer_total(dealer_hand) <= 21
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
