puts "Давайте узнаем ваш треугольник равнобедренный, прямоугольный или не прямоугольный"

puts "Введите значение A"
a = gets.to_i
puts "Введите значение B"
b = gets.to_i
puts "Введите значение C"
c = gets.to_i

ac = 4 * a * c
D = b ** 2 - ac



if D > 0
  bc_plus  = -b + Math.sqrt(D)
  bc_minus = -b - Math.sqrt(D)
  aa = 2 * a
  q = bc_plus / aa
  y = bc_minus / aa
  puts "Уравнение имеет два корня #{q} и #{y}"

  elsif D == 0
    z = -b / 2 * a
    puts "Уравнение имеет один корень #{z}"
  elsif D < 0
    puts "Корней нет"
end
