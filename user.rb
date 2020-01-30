class User < Player
  def take_card(cards)
    card = super(cards)
    puts "#{name} got card #{card.face}"
  end
end
