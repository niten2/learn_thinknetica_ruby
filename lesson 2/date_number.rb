months_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts 'Введите день'
number = gets.chomp.to_i

puts 'Введите месяц'
month  = gets.chomp.to_i

unless number >= 1 && number <= months_day[month]
  puts 'введите корректный день в месяце'
  exit
end

def Time.leap?(year)
  if year % 400 == 0 || year % 4 == 0
    true
  else
    false
  end
end

puts 'Введите год'
year = gets.chomp.to_i

if year > 1 && year < 3000
  leap = Time.leap?(year)
else
  puts 'Введите корректный год'
end

months_day[1] = 29 if leap

day_count = 0
x = 0
while x < month - 1
  day_count += months_day[x]
  x += 1
end

puts "Количество дней от начала года #{day_count}"

if leap
  puts 'Год Високостный'
else
  puts 'Год НЕ Високостный'
end
