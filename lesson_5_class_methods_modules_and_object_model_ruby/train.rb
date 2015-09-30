class Train
  include Company
  include InstanceCounter
	attr_accessor :speed, :wagon, :type, :route, :station, :number

  # NUMBER_FORMAT =

  @@tain_list = {}

	def initialize(number, type)
    register_instance
    @type = type
    @number = number
		@speed = 0
		@wagon = []
    @@tain_list[number] = self
		validate!
    puts "Собран новый поезд №#{@number}, типа #{@type}"

    unless type != :cargo || type != :passenger
      puts "dsfasdfsdf"
    end

	end

  def self.find(number)
    if @@tain_list[number].nil?
      puts "Такой обьект не найден, возвращаю nil"
    else
      @@tain_list[number]
    end
  end

	def type
		puts "Поезд №#{@number} типа #{@type}"
	end

	def speed
		puts "Поезд №#{@number} имеет скорость #{@speed} км/ч"
	end

	def speed_up
		@speed += 20
		if speed_zero?
			puts "Поезд №#{@number} сдвинулся с места и поехал со скоростью 20 км/ч"
		else
			puts "Поезд №#{@number} ускорился на 20 км/ч, теперь его скорость составляет #{@speed}"
		end
	end

	def stop
		if speed_zero?
			puts "Поезд №#{@number} уже стоит"
		else
      @speed = 0
      puts "Поезд №#{@number} остановлен"
		end
	end


  def add_wagon(wagon)
    if wagon_such_train?(wagon) && speed_zero?
      @wagon << wagon.list
      puts "К грузовому поезду №#{@number} добавлен грузовой вагон №#{wagon.list}, теперь у него вагонов #{@wagon.size} шт."
    elsif !wagon_such_train?(wagon) && !speed_zero?
      puts "Сначала остановите поезд, для того что бы добавить к нему вагон"
    elsif !wagon_such_train?(wagon)
      puts "Вы не можете присоединить этот вагон к этому поезду"
    end
  end


  def list_wagon
    puts "У поезда сейчас вагонов #{@wagon.size} шт."
    puts "К поезду присоединены вагоны под номерами #{@wagon}"

  end

	def delete_wagon
		if speed_zero?
			@wagon.pop
			puts "От поезда №#{@number} отцеплен вагон"
		else
			puts "Сначала остановите поезд"
		end
	end

	def take_route(station)
		@station = station
    puts "Поезд №#{@number} готов ехать с станции #{@station.first} на станцию #{@station.last}"
	end

  def move(station)
    if @route.include?(station)
      @station = station
      puts "Поезд №#{@number} приехал на с станцию #{@station}"
    else
      puts "Такой станции нет в маршруте"
    end
  end

  def list
    return {@number => @type}
  end




private

  def speed_zero?
    @speed.zero?
  end

  def count_hash_dublicate(hash, value)
    count = 0
    hash.values.each do |t|
      if t == value
        count += 1
      end
    end
    return count
  end

  def wagon_such_train?
  end

  def validate!
    raise "Number can't be nil" if number.nil?
    # raise "Number has invalid format" if number !~ NUMBER_FORMAT
    raise "Type should be cargo or passenger" if type != :cargo && type != :passenger
    true
  end

end

