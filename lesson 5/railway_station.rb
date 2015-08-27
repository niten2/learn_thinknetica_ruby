class RailwayStation
  @@all_station = []

  def initialize(name)
		@name = name
    @@all_station << name
    @trains = {}
		puts "Станция #{@name} создана"
	end

  def self.all
    puts "На данный момент существуют следующие станции #{@@all_station}"
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
		if @number.nil? || @type.nil?
			puts "Невозможно принять такой поезд"
		else
			# @trains << {@number => @type}
      @trains[@number] = @type
			puts "Поезд с номером #{@number} и типом #{@type} принят на станцию"
		end
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

  private
  # У меня нет идей какие методы можно внести сюда
end
