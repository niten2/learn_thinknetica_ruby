puts "Давайте вычислим корни квадратного уравнения"

puts "Введите значение A"
a = gets.to_f
puts "Введите значение B"
b = gets.to_f
puts "Введите значение C"
c = gets.to_f

D = b ** 2 - (4 * a * c)

if D > 0
  x1= (-b + Math.sqrt(D)) / (2 * a)
  x2= (-b - Math.sqrt(D)) / (2 * a)
  puts "Уравнение имеет два корня #{x1} и #{x2}"

  elsif D == 0
    x1 = -b / 2 * a
    puts "Уравнение имеет один корень #{x1}"

  else
    puts "Корней нет"
end
