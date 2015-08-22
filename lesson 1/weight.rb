# Идеальный вес. Программа запрашивает имя и рост и выводит идеальный вес по формуле <рост> - 110, после чего выводит результат пользователю на экран с обращением по имени. Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"

puts "Your name?"
name = gets.chomp.capitalize

puts "Your height?"
height = gets.chomp.to_i

ideal_height = height - 110

if ideal_height < 0
  puts "Your weight has an optimum "
else
  puts "Helloy #{name}, you ideal height = #{ideal_height}"
end

