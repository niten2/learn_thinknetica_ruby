# Площадь треугольника. Площадь треугольника можно вычилсить, зная его основание (a) и высоту (h) по формуле: 1/2*a*h. Программа должна запрашивать основание и высоту треуголиника и возвращать его площадь.

puts "We compute ploschat triangle"

puts "Enter a value A"
a = gets.chomp.to_i
puts "Enter a value H"
h = gets.chomp.to_i

if a == 0 || h == 0
  puts "Enter correct the number A and H!"
else
  s = 0.5 * a * h
  puts "Area triangle = #{s}"
end
