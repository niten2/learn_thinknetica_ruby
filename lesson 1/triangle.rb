puts 'We compute ploschat triangle'

puts 'Enter a value A'
a = gets.chomp.to_i
puts 'Enter a value H'
h = gets.chomp.to_i

if a == 0 || h == 0
  puts 'Enter correct the number A and H!'
else
  s = 0.5 * a * h
  puts "Area triangle = #{s}"
end
