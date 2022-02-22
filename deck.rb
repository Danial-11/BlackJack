class Deck
  attr_reader :cards
  attr_accessor :totalCards

  def initialize
    @cards = deckCards
  end

  def deck_Cards
    totalCards = 52
    cards = []
    @value = ["A", 2, 3, 4, 5, 6, 7, 8, 9, "J", "Q", "K"]
    @suit = ['♠', '♣', '♥', '♦']
    @suit.each do |suit|
      @value.each do |value|
        cards << Card.new(value, suit)
      end
    end
    cards
  end

  def give_Cards
    @chosen_card = cards.sample
    cards.delete(@chosen_card)
    @chosen_card
  end
end
