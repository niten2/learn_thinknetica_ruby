# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным

months_day = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]

puts "Введите день"
number = gets.chomp.to_i

puts "Введите месяц"
month  = gets.chomp.to_i

# Проверка корректного дня в месяце
unless number >= 1 && number <= months_day[month]
  puts "введите корректный день в месяце"
  exit
end

# Year
 def Time.leap?(year)
  if year % 400 == 0 || year % 4 == 0
   true
  else
   false
 end
end

puts "Введите год"
year = gets.chomp.to_i

if year > 1 && year < 3000
  leap = Time.leap?(year)
  else
    puts "Введите корректный год"
end

# Что делать если год Високостный
if leap
  months_day[1] = 29
end

# Подсчет дней
day_count = 0
x = 0
while x < month - 1
  day_count += months_day[x]
  x += 1
end
day_count + number


puts "Количество дней от начала года #{day_count}"

if leap
  puts "Год Високостный"
else
  puts "Год НЕ Високостный"
end





# # Year
#  def Time.leap?(year)
#   if year % 400 == 0
#    true
#   elsif year % 100 == 0
#    false
#   elsif year % 4 == 0
#    true
#   else
#    false
#  end
# end
