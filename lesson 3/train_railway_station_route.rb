# С этого занятия мы будем создавать прилоежение, которое поможет диспетчеру железнодорожной странции управлять поездами: принимать, отправлять, показывать информацию и т.д. (точнее, мы будем создавать его объектную модель). Нужно написать:
# Классы Train и RailwayStation, Route для поезда, ж.д. станции и маршрута соответственно.
# Станция:
# Имеет название, которое указывается при ее создании
# Может принимать поезда
# Может показывать список всех поездов на станции, находящиеся в текущий момент
# Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (при этом, поезд удаляется из списка поездов, находящихся на станции).
# Маршрут:
# Имеет начальную и конечную станцию, а также список промежуточных станций
# Может добавлять станцию в список
# Может удалять станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
# Поезд:
# Имеет, тип, который указывается при создании: грузовой, пассажирский и количество вагонов.
# Поезд может делать следующие вещи:
# набирать скорость
# показывать текущую скорость
# тормозить
# показывать количество вагонов
# прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Принимать маршрут следования
# Перемещаться между станциями, указанными в маршруте.
# Показывать предыдущую станцию, текущую, следующую, на основе маршрута



class Train

	attr_accessor :speed, :wagon, :type, :route, :station

	def initialize(number, type)
    if type == :freight
			@type = "freight"
		else
			@type = "passenger"
		end
		@number = number
    @train = {number => @type}
		@speed = 0
		@wagon = 0
		puts "Собран новый поезд №#{@number}, типа #{@type}"
	end

	def type
		puts "Поезд №#{@number} типа #{@type}"
	end

	def speed
		puts puts "Поезд №#{@number} имеет скорость #{@speed}"
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

	def add_wagon
		if speed_zero?
			@wagon += 1
			puts "Поезду №#{@number} добавлен новый вагон, теперь у него вагонов #{@wagon} шт."
		else
			puts "Сначала остановите поезд, для того что бы добавить к нему вагон"
		end
	end

	def delete_wagon
		if speed_zero?
			@wagon -= 1
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

  # def speed_more_zero?
  #   @speed > 0
  # end

  def count_hash_dublicate(hash, value)
    count = 0
    hash.values.each do |t|
      if t == value
        count += 1
      end
    end
    return count
  end
end

class RailwayStation
  def initialize(name)
		@name = name
		@trains = {}
		puts "Станция #{@name} создана"
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
end

class Route
	attr_accessor :route

	def initialize(stations = [])
		if stations.size >= 2
      @stations = stations
		# @route = []
			puts "Маршрут #{@stations.first} - #{@stations.last} создан"
    else
      puts "В маршруте мало станций"
    end
	end

	def start_route
		puts "Первая станция данного маршрута #{@stations[0]}"
	end

	def end_route
		puts "Последняя станция данного маршрута #{@stations[-1]}"
	end

	def middle_route
		puts "Промежуточные станции данного маршрута #{@stations[1..-2]}"
	end

	def add(station)
		@stations.insert(-2, station)
		puts "Новая станция (#{station}) добавлена в маршрут"
	end

	def delete(station)
		if @stations.include?(station)
			@stations.delete(station)
			puts "Станция #{station} удалена из маршрута"
		else
			puts "Станции #{station} станции нет в маршруте"
		end
	end

	def list
	  puts "Маршрут от #{@stations.first} до #{@stations.last}"
    @stations.each_with_index{ |station, index| puts "#{index + 1}. #{station}"}
	end

	def stations
    @stations
  end

end

