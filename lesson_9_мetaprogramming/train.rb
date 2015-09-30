class Train
  extend Accessor
  include Company
  include Validation
  include InstanceCounter
  attr_accessor :speed, :wagon, :type, :route, :station, :name, :type_class

  attr_accessor_with_history :xxx, :yyy
  strong_attr_accessor(:strong_attr, String)

  NUMBER_FORMAT = /^(\w|\d){3}-*(\w|\d){2}$/
  @@tain_list = {}

  validate :name,       :presence
  validate :name,       :format,  NUMBER_FORMAT
  validate :type_class, :type,    "Train"

  def initialize(name, type)
    register_instance
    @name = name
    @type = type
    @type_class = self.class

    validate!

    message_created
    @speed = 0
    @wagon = []
    @@tain_list[name] = self
  end

  def self.find(name)
    if @@tain_list[name].nil?
      puts 'Такой обьект не найден, возвращаю nil'
    else
      @@tain_list[name]
    end
  end

  def speed
    puts "Поезд №#{@name} имеет скорость #{@speed} км/ч"
  end

  def speed_up
    @speed += 20
    if speed_zero?
      puts "Поезд №#{@name} сдвинулся с места и поехал со скоростью 20 км/ч"
    else
      puts "Поезд №#{@name} ускорился на 20 км/ч,"
      puts "теперь его скорость составляет #{@speed}"
    end
  end

  def stop
    if speed_zero?
      puts "Поезд №#{@name} уже стоит"
    else
      @speed = 0
      puts "Поезд №#{@name} остановлен"
    end
  end

  def add_wagon(wagon)
    unless wagon_such_train?(wagon)
      if !speed_zero?
        puts 'Сначала остановите поезд, для того что бы добавить к нему вагон'
      else
        @wagon << wagon
        puts "К грузовому поезду №#{@name} добавлен грузовой вагон
        №#{wagon.list}, теперь у него вагонов #{@wagon.size} шт."
      end
    end
  end

  def list_wagon
    puts "У поезда сейчас вагонов #{@wagon.size} шт."
  end

  def delete_wagon
    if speed_zero?
      @wagon.pop
      puts "От поезда №#{@name} отцеплен вагон"
    else
      puts 'Сначала остановите поезд'
    end
  end

  def take_route(station)
    @station = station
    puts "Поезд №#{@name} готов ехать с станции #{@station.first}
    на станцию #{@station.last}"
  end

  def move(station)
    if @route.include?(station)
      @station = station
      puts "Поезд №#{@name} приехал на с станцию #{@station}"
    else
      puts 'Такой станции нет в маршруте'
    end
  end

  def list
    { @name => @type }
  end

  def valid?
    validate!
  rescue
    false
  end

  def each_wagon(&block)
    @wagon.each { |wagon| block.call(wagon) }
  end

  private

  def speed_zero?
    @speed.zero?
  end

  def count_hash_dublicate(hash, value)
    count = 0
    hash.values.each do |t|
      count += 1 if t == value
    end
    count
  end

  def wagon_such_train?(wagon)
    fail 'Wagon type not suitable Train type' if wagon.type == type
    true
  rescue
    puts 'Этот вагон не подходит к этому поезду'
  end

  def message_created
    puts "Собран новый поезд №#{@name}, типа #{@type}"
  end

  def type_not_cargo_or_passenger
    @type == :cargo || @type == :passenger
  end

end


# def validate!
  #   fail "Number can't be nil" if number.nil?
  #   fail 'Number has invalid format' if number !~ NUMBER_FORMAT
  #   fail 'Type should be cargo or passenger' unless type_not_cargo_or_passenger
  #   fail 'Number can not be the same' unless @@tain_list[number].nil?
  #   true
  # end
