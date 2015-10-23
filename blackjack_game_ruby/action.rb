class Action
  attr_accessor :play_game, :money_player, :money_diler,
                :money_bank, :money_bet, :player_sum, :diler_sum

  def initialize(player, diler, carts)
    @player = player
    @diler  = diler
    @carts = carts
  end

  def hello_name
    puts 'Введите ваше Имя'
    name = gets.chomp.capitalize
    puts "Hello #{name}"
  end

  def do_bet
    @money_bank = 0 if @money_bank.nil?

    @money_player -= @money_bet
    @money_diler -= @money_bet
    @money_bank += @money_bet * 2
  end

  def game_begin
    let_play?
    while play_game != '0'
      case play_game
      when '1'
        new_game
      else
        input_correct_integer
        self.play_game = gets.chomp
        end
    end
    goodbye
  end

  def new_game
    do_bet
    player_and_diler_two_carts
    puts_info
    selecting_actions_1
    case
    when @action == 1
      action_diler
      puts_info
      selecting_actions_2
      case
      when @action == 1
        player_get_cart
      else
        input_correct_integer
      end
      end_game
    when @action == 2
      player_get_cart
      puts_info
      action_diler
      end_game
    when @action == 3
      end_game
    else
      input_correct_integer
    end
    puts 'Игра закончена'
    puts_info_bet
    let_play?
  end

  def let_play?
    puts 'Давайте играть? да (1), нет (0):'
    self.play_game = gets.chomp
  end

  def selecting_actions_1
    puts "Введите номер вашего действия: \n
      1.) Пропустить
      2.) Добавить карту
      3.) Открыть карты"
    @action = gets.chomp.to_i
  end

  def selecting_actions_2
    puts "Введите номер вашего действия: \n
           1.) Добавить карту
           2.) Открыть карты"
    @action = gets.chomp.to_i
   end

  def player_and_diler_two_carts
    puts 'Дилер раздает карты...'
    2.times { @player.take_card(@carts) }
    2.times { @diler.take_card(@carts) }
  end

  def player_get_cart
    fail puts 'КОЛОДА закончена' if @carts.nil?
    @player.take_card(@carts)
    puts 'Дилер добавил вам карту...'
  end

  def puts_info
    puts "Ваши карты: #{@player.cart_face},"
    puts "У вас : #{@player.sum} очков,"
    puts "У Дилера  #{@diler.cart_size} карт."
  end

  def puts_info_bet
    puts "В банке сейчас  #{@money_bank} $,"
    puts "У Дилера сейчас  #{@money_diler} $,"
    puts "У Игрока сейчас  #{@money_player} $."
  end

  def end_game
    puts 'Игроки вскрывают карты...'
    puts "У вас #{@player.sum} очков \nУ дилера #{@diler.sum} очков"
    Gambler.winner(@player, @diler)
    winner = Gambler.winner(@player, @diler)
    if winner == @player
      puts 'Поздравляю вы ПОБЕДИЛИ'
      puts 'Дилер выплачивает вам ваш выигрышь'
      money_bank_win_player
    elsif winner == :no_one
      puts 'Никто не победил'
      puts 'Деньги остаются в банке'
    else
      puts 'Примите сожаления вы ПРОИГРАЛИ'
      puts 'Дилер забирает деньги из банка себе'
      money_bank_win_diler
    end
    @player.carts.clear && @diler.carts.clear
  end

  def money_bank_win_player
    @money_player += @money_bank
    @money_bank = 0
  end

  def money_bank_win_diler
    @money_diler += @money_bank
    @money_bank = 0
  end

  def action_diler
    puts 'Ход дилера...'
    if @diler.sum >= 18
      puts 'Дилер пропускает ход...'
    else
      @diler.take_card(@carts)
      puts 'Дилер берет себе карту...'
    end
  end

  def goodbye
    puts 'Всего хорошего заходите еще!'
  end

  def input_correct_integer
    puts 'Введите корректное число'
  end
end
