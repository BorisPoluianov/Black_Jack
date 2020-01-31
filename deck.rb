# frozen_string_literal: true

class Deck
  attr_reader :cards

  def initialize
    @cards = generate_cards
  end

  private

  def generate_cards
    cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each_with_index do |rank, i|
        cards << Card.new(suit, rank, Card::VALUES[i])
      end
    end
    cards.shuffle
  end
end
