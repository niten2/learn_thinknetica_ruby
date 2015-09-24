class Wagon
  include Company
  include Validation

  attr_reader :type

  validate :number,         :presence
  validate :type_class,     :type,     "Wagon"

  def initialize(number, type)
    @number = number
    @type = type
    @type_class = self.class
    validate!
    message_created
  end



  def list
    @number
  end

  def valid?
    validate!
  rescue
    false
  end

  private


  def message_created
    puts "Создан вагон №#{@number} типа #{@type}"
  end

  def type_not_cargo_or_passenger
    @type == :cargo || @type == :passenger
  end

end

  # def validate!
  #   fail "Number can't be nil" if @number.nil?
  #   fail 'Type should be cargo or passenger' unless type_not_cargo_or_passenger
  #   true
  # end
