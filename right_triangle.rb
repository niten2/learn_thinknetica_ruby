puts "Давайте узнаем ваш треугольник равнобедренный, прямоугольный или не прямоугольный"

puts "Введите значение A"
a = gets.to_i
puts "Введите значение B"
b = gets.to_i
puts "Введите значение C"
c = gets.to_i

if a > b && a > c
  hypotenuse = a
  cathetus1 = b
  cathetus2 = c
  elsif b > a && b > c
    hypotenuse = b
    cathetus1 = a
    cathetus2 = c
  elsif c > b && c > a
    hypotenuse = c
    cathetus1 = a
    cathetus2 = b
end


if a == b && a == c
  puts "Треугольник равнобедренный, но не прямоугольный"
  elsif hypotenuse ** 2 == cathetus1 ** 2 + cathetus2 ** 2
    puts "Треугольник прямоугольный"
  else
    puts "Треугольник НЕ прямоугольный"
end






