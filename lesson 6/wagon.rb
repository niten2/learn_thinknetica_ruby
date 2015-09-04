class Wagon
  include Company

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    message_created
  end

  def type
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
  end

  def message_created
    puts "Создан вагон №#{@number} типа #{@type}"
  end

end
