# frozen_string_literal: true

class Hand
  attr_reader :hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def take_card(deck)
    card = deck.cards.sample
    @cards << card
    deck.cards.delete(card)
  end

  def score
    @score = 0
    @cards.each do |card|
      @score += if @score + card.value.max > 21
                  card.value.min
                else
                  card.value.max
                end
    end
    @score
  end
end
