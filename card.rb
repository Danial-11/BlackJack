# frozen_string_literal: true

# new class card
class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    return 10 if %w[J K Q].include?(@rank)
    return 11 if @rank == 'A'

    @rank
  end

  def to_s
    "#{rank} of #{suit}"
  end
end
