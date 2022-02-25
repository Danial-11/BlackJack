# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)
require_relative 'card'

# new class deck
class Deck
  attr_accessor :card

  def initialize
    @card = []
    rank = [2, 3, 4, 5, 6, 7, 8, 9]
    suit = %i[Diamonds Hearts Spades Clubs]
    suit.each do |suit|
      rank.each do |rank|
        @card << Card.new(rank, suit)
      end
      @card << Card.new('J', suit)
      @card << Card.new('Q', suit)
      @card << Card.new('K', suit)
      @card << Card.new('A', suit)
    end
  end

  def shuffle
    @card.shuffle!
  end

  def take
    @selected_card = @card.sample
    @card.delete(@selected_card)
    @selected_card
  end
end
