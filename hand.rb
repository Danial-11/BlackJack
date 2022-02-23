class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def total_Value
    i = 0
    cards_value = []
    while i < @cards.length
      value = @cards[1].value
      case value
      when 'J' || 'Q' || 'K'
        value = 10
      when 'A'
        value = 1
      else
        value = value.to_i
      end
      cards_value << value
      i += 1
    end
    total_Value = cards_value.inject {|sum, num| sum + num}
  end
end
