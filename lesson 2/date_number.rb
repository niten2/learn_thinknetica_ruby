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
  if year % 400 == 0
   true
  elsif year % 100 == 0
   false
  elsif year % 4 == 0
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






# month
# months_day.index(month)
# x = 0
# months_day[month - 1]
# day = 0
# x = 0
# while  month <= 0
#   day += months_day[x]
#   x = month - 1
#   # months_day_count = months_day[month - 1]
# end
# p day
# months_count = 0
# months_while = 0
# months_count_day = 0
# months_sum_day = 0
# months_count_day_2 = 0
# months_name = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
# while  months_while <= 0
#   months_while = months_name.index(month) - 1
#   months_count += months_while
# end
# p months_count
# months_count = months_count_day_2
# while  months_count_day_2 <= 0
#   months_sum_day += months_day[months_count_day_2]
#   months_count_day_2 -= 1
# end
# p months_sum_day
# количество дней
# t = Time.now
# day = t.yday # 315
# проверка на высокосньсть
# require "date"
# flag1 = Date.julian_leap? 1700    # true
# flag2 = Date.gregorian_leap? 1700 # false
# flag3 = Date.leap? 1700           # false
#  def Time.leap? Year
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
# p flag1
# months_h = { "january" => 31, "february" => 28, "march" => 31, "april" => 30, "may" => 31, "june" => 30, "july" => 31, "august" => 31, "september" => 30, "october" => 31, "november" => 30, "december" => 31 }
# months.each { |month, days| puts month if days == 30 }
# months.each_with_index { |letter, index| vowels[letter] = index + 1 if ['a', 'e', 'o', 'u','i'].include?(letter) }
# p months_h[month]
# p months_ary.index(month) + 1
# month_number = months_ary.index(month) + 1
# all = number +
