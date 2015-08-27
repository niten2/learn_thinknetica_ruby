class Wagon
  include Company

  def initialize(number, type)
    @number = number
    @type = type
    puts "Создан вагон №#{@number} типа #{@type}"
  end

  def type
    puts "Этот вагон №#{@number} типа #{@type}"
  end

  def list
    return @number
  end

end
