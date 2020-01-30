class Dealer < Player
  def initialize(name = 'Dealer')
    super(name)
  end

  def take_card(cards)
    super(cards)
    puts "Did #{name} take a card?"
  end

  def step(step)
    if score > 17 || @cards.size == 3
      puts "#{self.name} missed step."
    else
      take_card(step)
    end
  end

  def hide_cards
    hide_cards = ''
    @cards.each { hide_cards = "#{hide_cards}?" }
    hide_cards
  end
end
