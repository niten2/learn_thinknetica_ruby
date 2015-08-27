class Route

  def initialize(stations = [])
    if stations.size >= 2
      @stations = stations
      puts "Маршрут #{@stations.first} - #{@stations.last} создан"
    else
      puts "В маршруте мало станций"
    end
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


private
  # У меня нет идей какие методы можно внести сюда
end



# Ненужные методы
 # def stations
 #    @stations
 #  end

 # def start_route
 #  print stations
 # puts "Первая станция маршрута #{@stations.first} - #{@stations.last}  это #{@stations[0]}"
 # # end

 # def end_route
 #   puts "Последняя станция данного маршрута #{@stations[-1]}"
 # end

  # def middle_route
  #   puts "Промежуточные станции данного маршрута #{@stations[1..-2]}"
  # end
