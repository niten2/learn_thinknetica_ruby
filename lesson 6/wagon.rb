class Wagon
  include Company

  def initialize(number, type)
    @number = number
    @type = type

    # validate!
    if self.valid?
      puts "Создан вагон №#{@number} типа #{@type}"
    end



  end

  def type
    # puts "Этот вагон №#{@number} типа #{@type}"
    @type
  end

  def list
    return @number
  end

  def valid?
    validate!
  rescue
    false
  end

private
  def validate!
    raise "Number can't be nil" if @number.nil?
    raise "Type should be cargo or passenger" unless @type == :cargo || @type == :passenger
    true
  rescue
    puts "Вагон не создан, Вагон должен иметь номер и быть типа cargo или passenger"
  end



end
