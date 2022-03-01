# frozen_string_literal: true

# This module handles scores of players and dealer
module Meths
  def player_total(player_hand)
    player_hand.inject(0) { |sum, rank| sum + rank.value }
  end

  def dealer_total(dealer_hand)
    dealer_hand.inject(0) { |sum, rank| sum + rank.value }
  end
end
