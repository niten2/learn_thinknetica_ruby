class Route

  def initialize(stations = [])
    @stations = stations
    validate!
    message_created
  end

	def add(station)
		@stations.insert(-2, station)
		puts "Новая станция #{station} добавлена в маршрут"
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

  def valid?
    validate!
  rescue
    false
  end

private

  def validate!
    raise "Stations can't be nil"     if @stations.nil?
    raise "Stations should be more 2" if @stations.size <= 2
    raise "Stations incorrect"        if !all_station_include_station?
    true
  end

  def all_station_include_station?
    (@stations - RailwayStation.all).empty?
  end

  def message_created
    puts "Маршрут от #{@stations.first} до #{@stations.last} создан"
  end
end

