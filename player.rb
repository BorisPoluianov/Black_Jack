# frozen_string_literal: true

class Player
  attr_reader :name, :hand
  attr_accessor :bank, :cards

  def initialize(name)
    @name = name
    @bank = 100
    @hand = Hand.new
  end

  def make_bet(bank)
    @bank -= 10
    bank.debet(10)
  end

  def add_money(money)
    @bank += money
  end

  def take_card(deck)
    @hand.take_card(deck)
  end

  def score
    @hand.score
  end

  def all_cards
    all_cards = ''
    @hand.cards.each { |card| all_cards = "#{all_cards} #{card.face}" }
    all_cards
  end
end
