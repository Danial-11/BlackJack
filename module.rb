# frozen_string_literal: true

# This module handles scores of players and dealer
module Meths
  def score(hand)
    hand.inject(0) { |sum, rank| sum + rank.value }
  end
end
