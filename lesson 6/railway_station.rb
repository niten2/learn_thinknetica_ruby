class RailwayStation

  include InstanceCounter
  attr_accessor :name

  @@all_station = []

  def initialize(name)
    register_instance

		@name = name

    if self.valid?
      puts "Станция #{@name} cоздана"
      @@all_station << name
      @trains = {}
    end

	end

  def self.all
    @@all_station
    # puts "На данный момент существуют следующие станции #{@@all_station}"
  end




	def list
		puts "На станции сейчас #{@trains.length} поездов"
	end

	def list_type
    puts "На станции поездов типа Freight: #{count_hash_dublicate(@trains, "freight")}"
    puts "На станции поездов типа Passenger: #{count_hash_dublicate(@trains, "passenger")}"
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

  private

  def validate!
    raise "Number can't be nil"                 if name.nil?
    raise "Number should be at least 3 symbols" if name.length < 3
    true
    rescue
    puts "Станция #{@name} НЕ создана, Станция должна иметь имя и быть больше 3 символов"
  end

  # end
end


