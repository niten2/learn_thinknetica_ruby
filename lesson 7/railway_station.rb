class RailwayStation
  include InstanceCounter
  attr_accessor :name
  @@all_station = []

  def initialize(name)
    register_instance
    @name = name
    validate!
    @@all_station << name
    @trains = []
    message_created
  end

  def self.all
    @@all_station
  end

  def list
    puts "На станции сейчас #{@trains.length} поездов"
  end

  def list_type
    puts "На станции поездов типа Freight:
          #{count_train_type(@trains, :freight)}"
    puts "На станции поездов типа Passenger:
          #{count_train_type(@trains, :passenger)}"
  end

  def take_train(train)
    @trains << train
    puts "Поезд с номером #{train.number}
          и типом #{train.type} принят на станцию"
  end

  def send_train(train)
    if @trains.include?(train)
      @trains.delete(train)
      puts "Поезд Номер: #{train.number} покинул станцию"
    else
      puts 'На станции нет такого поезда'
    end
  end

  def valid?
    validate!
  rescue
    false
  end

  def each_train(&_block)
    if block_given?
      @trains.each { |train| yield(train) }
    else
      puts 'Передайте агрументом блок'
    end
  end

  private

  def validate!
    fail "Number can't be nil" if name.nil?
    fail 'Number should be at least 3 symbols' if name.length < 3
    true
  end

  def message_created
    puts "Станция #{@name} cоздана"
  end

  def count_train_type(trains, type)
    count = 0
    trains.each { |train| count += 1 if train.type == type }
    count
  end
end
