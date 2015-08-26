require_relative "./train_railway_station_route.rb"


puts "СОЗДАНИЕ"
train_1 = Train.new(88, :freight)
train_2 = Train.new(90, :freight)
train_3 = Train.new(28, :passenger)
train_4 = Train.new(10, :passenger)

station_1 = RailwayStation.new("Moscow")
# station_2 = RailwayStation.new("Krasnoyarsk")

route_1 = Route.new(["Moscow", "Kazan", "Omsk", "Krasnoyarsk"])
route_2 = Route.new(["Novosibirsk", "Krasnoyarsk", "Irkutsk"])

puts "ПОЕЗДА"
train_1.type
train_1.speed
train_1.speed_up
train_1.add_wagon
train_1.speed
train_1.stop
train_1.stop
train_1.add_wagon
train_1.add_wagon
train_1.delete_wagon
train_1.take_route(route_1.list)



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

puts "МАРШРУТЫ"
route_1.start_route
route_1.end_route
route_1.middle_route
route_1.add("Vladivostok")
route_1.middle_route
route_1.delete("Lianozovo")
route_1.delete("Vladivostok")
route_1.list




