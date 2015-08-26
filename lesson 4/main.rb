require_relative "./train.rb"
require_relative "./cargo_train.rb"
require_relative "./passanger_train.rb"

require_relative "./railway_station.rb"
require_relative "./route.rb"



puts "\n"
puts "****************" + " " + "СОЗДАНИЕ" + " " + "****************"
puts "\n"

# train_1 = Train.new(88, :freight)
# train_2 = Train.new(90, :freight)
# train_3 = Train.new(28, :passenger)
# train_4 = Train.new(10, :passenger)

# station_1 = RailwayStation.new("Moscow")
# station_2 = RailwayStation.new("Krasnoyarsk")

# route_1 = Route.new(["Moscow", "Kazan", "Omsk", "Krasnoyarsk"])
# route_2 = Route.new(["Novosibirsk", "Krasnoyarsk", "Irkutsk"])



puts "\n"
puts "****************" + " " + "ПОЕЗДА" + " " + "****************"
puts "\n"
train_1 = CargoTrain.new(88)
train_2 = PassangerTrain.new(8811)

# train_1.type
# train_1.speed
# train_1.speed_up
# train_1.add_wagon_passanger
# train_1.add_wagon_cargo
# train_1.list_wagon

train_2.speed_up
train_2.type
train_2.add_wagon_cargo
train_2.add_wagon_passanger



# train_1.speed
# train_1.speed_up

# train_1.speed
# train_1.stop
# train_1.stop
# train_1.add_wagon
# train_1.add_wagon
# train_1.delete_wagon
# train_1.take_route(route_1.list)



# puts "СТАНЦИИ"
# station_1.list
# station_1.list_type

# station_1.take_train(train_1.list)
# station_1.take_train(train_2.list)
# station_1.take_train(train_3.list)

# station_1.list
# station_1.list_type
#
# station_1.take_train
# station_1.take_train(train_1.list)
# station_1.take_train(train_2.list)
# station_1.take_train(train_3.list)
# station_1.take_train(train_4.list)
# station_1.list
# station_1.list_type
# station_1.send_train(train_4.list)
# station_1.list_type

# puts "\n"
# puts "****************" + " " + "МАРШРУТЫ" + " " + "****************"
# puts "\n"

# route_1.add("Vladivostok")
# route_1.middle_route
# route_1.delete("Lianozovo")
# route_1.delete("Vladivostok")
# route_1.list





