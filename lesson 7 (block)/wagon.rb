class Wagon
  include Company

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    message_created
  end

  attr_reader :type

  def list
    @number
  end

  def valid?
    validate!
  rescue
    false
  end

  private

  def validate!
    fail "Number can't be nil" if @number.nil?
    fail 'Type should be cargo or passenger' unless type_not_cargo_or_passenger
    true
  end

  def message_created
    puts "Создан вагон №#{@number} типа #{@type}"
  end

  def type_not_cargo_or_passenger
    @type == :cargo || @type == :passenger
  end

end
