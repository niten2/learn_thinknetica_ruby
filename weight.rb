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

