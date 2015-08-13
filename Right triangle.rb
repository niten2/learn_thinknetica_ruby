puts "Давайте узнаем ваш треугольник равнобедренный, прямоугольный или не прямоугольный"

puts "Введите значение A"
a = gets.to_i
puts "Введите значение B"
b = gets.to_i
puts "Введите значение C"
c = gets.to_i

if a > b && a > c
  longest_side ||= a ** 2
  other_side ||= b ** 2 + c ** 2

  elsif b > a && b > c
    longest_side ||= b ** 2
    other_side ||= a ** 2 + c ** 2

  elsif c > b && c > a
    longest_side ||= c ** 2
    other_side ||= a ** 2 + b ** 2
end

if a == b && a == c
  puts "Треугольник равнобедренный, но не прямоугольный"

  elsif longest_side == other_side
    puts "Треугольник прямоугольный"
  else
    puts "Треугольник НЕ прямоугольный"
end






