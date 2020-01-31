# frozen_string_literal: true

class Card
  SUITS = %w[♦ ♥ ♠ ♣].freeze
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze
  VALUES = [
    [11, 1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [10], [10], [10]
  ].freeze

  attr_reader :suit, :rank, :value

  def initialize(suit, rank, value)
    @suit = suit
    @rank = rank
    @value = value
  end

  def face
    rank + suit
  end
end
