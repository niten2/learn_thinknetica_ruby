class Gambler
  attr_accessor :carts

  def initialize
    @money = 100
    @carts = []
  end

  def self.winner(player, diler)
    return :no_one if player.sum > 21 && diler.sum > 21
    return :no_one if player.sum == diler.sum
    return player if diler.sum > 21
    return diler if player.sum > 21
    player.sum > diler.sum ? player : diler
  end

  def sum
    @sum = 0
    @ace_count = ace_count
    @carts.each do |card|
      @sum += card.value.join.to_i if card.value.size == 1
    end
    ace_processing!(@ace_count)
    @sum
  end

  def cart_face
    @cart_face = []
    @carts.each { |t| @cart_face << t.face }
    @cart_face
  end

  def take_card(carts)
    carts.sort_by! { rand }
    @carts << carts[0]
  end

  private

  def ace_processing!(ace_count)
    ace_count.times do
      if @sum + 10 <= 21
        @sum += 11
      else
        @sum += 1
      end
    end
    @sum
  end

  def ace_count
    ace_count = 0
    @carts.each do |card|
      ace_count += 1 if card.value.size == 2
    end
    ace_count
  end
end
