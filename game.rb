# frozen_string_literal: true

require_relative 'deck'
require_relative 'module'
# game class
class Game
  include Meths
  @player_score = 0
  @dealer_score = 0
  def initialize
    @dealer_hand = []
    @player_hand = []
    deck = Deck.new
    deck.shuffle
    2.times do
      @player_hand << deck.take
      @dealer_hand << deck.take
    end
    @player_score = score(@player_hand)
    @dealer_score = score(@dealer_hand)
    puts 'Welcome to BlackJack Game'
    puts "Dealer one card is facedown, other card is #{@dealer_hand[1]}"
    puts "Player cards:\n#{@player_hand.join("\n")}"
    puts "Player score: #{@player_score}"
    check_scores(deck)
  end

  def check_scores(deck)
    if @player_score == 21
      puts "Player cards:\n #{@player_hand.join("\n")}\nPlayer Score: #{@player_score}\nPlayer Wins!"
      exit
    elsif @player_score > 21
      puts "Player cards:\n #{@player_hand.join("\n")}\nPlayer Score: #{@player_score}\nPlayer Busted!"
      exit
    elsif @dealer_score == 21
      puts "Dealer cards:\n#{@dealer_hand.join("\n")}\nDealer Score: #{@dealer_score}\nDealer Wins!"
      exit
    else
      p_conditions(deck)
    end
  end

  def start_game
    initialize
  end

  def p_conditions(deck)
    while @player_score < 21
      puts "Press 'h' for hit or any other key to pass!"
      hit_pass = gets.chomp
      if hit_pass.casecmp('H').zero?
        @player_hand << deck.take
        puts "Player gets #{@player_hand[-1]}"
        @player_score = score(@player_hand)
        puts "Player new score: #{@player_score}"
      else
        d_conditions(deck)
      end
      check_player_score
    end
  end

  def d_conditions(deck)
    while @dealer_score < 17
      @dealer_hand << deck.take
      puts "Dealer gets #{@dealer_hand[-1]}"
      @dealer_score = score(@dealer_hand)
      puts "Dealer new score: #{@dealer_score}"
    end
    check_player_score
  end

  def check_player_score
    if @player_score > 21
      puts "Player cards:\n#{@player_hand.join("\n")}\nPlayer Busted!"
      exit
    elsif @player_score == 21
      puts "Player cards:\n#{@player_hand.join("\n")}\nPlayer Wins!"
      exit
    elsif @dealer_score > 21
      puts "Dealer cards:\n#{@dealer_hand.join("\n")}\nDealer Busted!"
      exit
    elsif @dealer_score == 21
      puts "Dealer cards:\n#{@dealer_hand.join("\n")}\nDealer Wins!"
      exit
    elsif @dealer_score > @player_score
      puts "Dealer cards:\n#{@dealer_hand.join("\n")}\nPlayer cards:\n#{@player_hand.join("\n")}\nDealer Wins!"
      exit
    elsif @dealer_score == @player_score
      puts "Dealer cards:\n#{@dealer_hand.join("\n")}\nPlayer cards:\n#{@player_hand.join("\n")}\nIt's a Tie!"
      exit
    end
  end
end
