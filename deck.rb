# frozen_string_literal: true

require_relative 'card'

# new class deck
class Deck
  attr_accessor :card

  def initialize
    @card = []
    rank = [2, 3, 4, 5, 6, 7, 8, 9]
    suit = %i[Diamonds Hearts Spades Clubs]
    suit.each do |suits|
      rank.each do |ranks|
        @card << Card.new(ranks, suits)
      end
      @card << Card.new('J', suits)
      @card << Card.new('Q', suits)
      @card << Card.new('K', suits)
      @card << Card.new('A', suits)
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
