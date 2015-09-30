class WagonPassenger < Wagon

  def initialize(number, type = :passenger)
    super
  end


private
  def such?
    # wagon.class == WagonPassenger
  end

end
