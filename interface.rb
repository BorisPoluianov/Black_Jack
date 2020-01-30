class Interface
  def initialize
    @controller = Controller.new(new_user)
  end


  def run
    new_game
  end

  private

  def new_user
    @user = User.new(ask_name)
  end

  def new_game
    game_over if @controller.money_empty?
    @controller.new_deck
    @controller.clear_players_cards
    round
  end

  def open_cards
    @controller.money_to_winner
    end_result_info
    one_more_game
  end

  def round
    @controller.take_two_cards_and_make_bet
    show_info
    move
    open_cards
  end

  def move
    case select_choice
    when '1'
      choice_card
    when '2'
      open_cards
    when '3'
      skip_move(@controller.user)
      @controller.dealer.move(@controller.deck)
      move
    else
      move
    end
  end

  def choice_card
    if @controller.card_limit?(@controller.user)
      card_limit
    else
      @user.take_card(@controller.deck)
      show_info
      if @controller.score_limit?(@controller.user)
        open_cards
      else
        @controller.dealer.move(@controller.deck)
        move
      end
    end
  end

  def game_over
    puts "You can not play no more. Your money: $#{@user.bank}. Dealers money: $#{@dealer.bank}"
    exit
  end

  def show_info
    puts '========= INFO ========='
    puts "#{@controller.user.score} points"
    puts "Bet = $#{@controller.bank.money}"
    puts "#{@controller.user.name} $#{@controller.user.bank}"
    puts "#{@controller.dealer.name} $#{@controller.dealer.bank}"
    puts "Your cards: #{@controller.user.all_cards}"
    puts "Dealer's cards: #{@controller.dealer.hide_cards}"
  end

  def end_result_info
    puts '========= GAME RESULTS ========='
    puts "Winner: #{winner_name}"
    puts "Dealer's cards: #{@controller.dealer.all_cards} & points: #{@controller.dealer.score}"
    puts "Your cards: #{@controller.user.all_cards} & points: #{@controller.user.score}"
  end

  def one_more_game
    puts "Play again? y/n"
    case gets.chomp
    when 'y'
      new_game
    when 'n'
      exit
    else
      one_more_game
    end
  end

  def skip_move(player)
    puts "#{player.name} skipped move"
  end

  def winner_name
    @controller.winner ? @controller.winner.name : 'tie'
  end

  def select_choice
    print '1 - take a card / 2 - open cards / 3 - skip a move => '
    gets.chomp
  end

  def ask_name
    print 'What is your name? '
    gets.chomp
  end

  def card_limit
    puts 'Card limit!'
    move
  end
end
