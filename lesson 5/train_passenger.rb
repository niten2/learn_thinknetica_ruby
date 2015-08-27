class TrainPassenger < Train

  def initialize(number, type = :passenger)
    super
  end

private

  def wagon_such_train?(wagon)
    wagon.class == WagonPassenger
  end

end

