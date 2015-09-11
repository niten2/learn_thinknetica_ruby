class RailwayStation
  include InstanceCounter
  attr_accessor :name
  @@all_station = []

  def initialize(name)
    register_instance
		@name = name
    validate!
    @@all_station << name
    @trains = {}
    message_created
	end

  def self.all
    @@all_station
  end

	def list
		puts "На станции сейчас #{@trains.length} поездов"
	end

	def list_type
    puts "На станции поездов типа Freight: #{count_train_type(@trains, "freight")}"
    puts "На станции поездов типа Passenger: #{count_train_type(@trains, "passenger")}"
	end


	def take_train(train = {})
    @number = train.keys.join
    @type   = train.values.join
		# if @number.nil? || @type.nil?
			# puts "Невозможно принять такой поезд"
		# else
			# @trains << {@number => @type}
      @trains[@number] = @type
			puts "Поезд с номером #{@number} и типом #{@type} принят на станцию"
		# end
	end

	def send_train(train = {})
    @number = train.keys.join
    @type   = train.values.join
    if @trains.include?({@number => @type})
      @trains.delete({@number => @type})
      puts "Поезд Номер: #{@number} покинул станцию"
    else
      puts "На станции нет такого поезда"
    end
  end

  def valid?
    validate!
    rescue
      false
  end

  def operation_of_each_train(&block)
    if block_given?
      block.call(@trains)
      else
        puts "Передайте агрументом блок"
    end
  end

private

  def validate!
    raise "Number can't be nil"                 if name.nil?
    raise "Number should be at least 3 symbols" if name.length < 3
    true
  end

  def message_created
    puts "Станция #{@name} cоздана"
  end

  def count_train_type(trains, type)
      count = 0
      trains.values.each {|t| count += 1 if t == type}
      return count
  end

end


