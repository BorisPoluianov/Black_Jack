class Dealer < Player
  def initialize(name = 'Dealer')
    super(name)
  end

  def take_card(cards)
    super(cards)
    puts "#{name} take a card."
  end

  def move(move)
    if score > 17 || @cards.size == 3
      puts "#{self.name} skipped move."
    else
      take_card(move)
    end
  end

  def hide_cards
    hide_cards = ''
    @cards.each { hide_cards << '🂠 ' }
    hide_cards
  end
end
