# frozen_string_literal: true

require_relative 'game'
# This module handles scores of players and dealer
module Checks
  def cond1
    return unless @player_score > 21

    print_one
  end

  def print_one
    puts "Player cards:\n#{@player_hand.join("\n")}\nDealer cards:\n#{@dealer_hand.join("\n")}\nPlayer Busted!"
    exit
  end

  def cond2
    return unless @player_score == 21

    print_two
  end

  def print_two
    puts "Player cards:\n#{@player_hand.join("\n")}\nDealer cards:\n#{@dealer_hand.join("\n")}\nPlayer Wins!"
    exit
  end

  def cond3
    return unless @dealer_score > 21

    print_three
  end

  def print_three
    puts "Player cards:\n#{@player_hand.join("\n")}\nDealer cards:\n#{@dealer_hand.join("\n")}\nDealer Busted!"
    exit
  end

  def cond4
    return unless @dealer_score == 21

    print_four
  end

  def print_four
    puts "Player cards:\n#{@player_hand.join("\n")}\nDealer cards:\n#{@dealer_hand.join("\n")}\nDealer Wins!"
    exit
  end

  def cond5
    return unless @dealer_score == @player_score

    print_five
  end

  def print_five
    puts "Player cards:\n#{@player_hand.join("\n")}\nDealer cards:\n#{@dealer_hand.join("\n")}\nIt is a Tie!"
    exit
  end

  def cond6
    return unless @dealer_score > @player_score

    print_six
  end

  def print_six
    puts "Player cards:\n#{@player_hand.join("\n")}\nDealer cards:\n#{@dealer_hand.join("\n")}\nDealer Wins!"
    exit
  end

  def cond7
    return unless @dealer_score < @player_score

    print_seven
  end

  def print_seven
    puts "Player cards:\n#{@player_hand.join("\n")}\nDealer cards:\n#{@dealer_hand.join("\n")}\nPlayer Wins!"
    exit
  end
end
