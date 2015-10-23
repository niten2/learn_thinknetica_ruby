class Diler < Gambler
  def cart_size
    '*' * @carts.size.to_i
  end
end
