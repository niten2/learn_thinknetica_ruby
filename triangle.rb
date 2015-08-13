def is_number?(s)
  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end


puts "We compute ploschat triangle"

puts "Enter a value A"
a = gets
puts "Enter a value H"
h = gets

if is_number?(a) && is_number?(h)
  s = 0.5 * a.to_i * h.to_i
  puts "Area triangle = #{s}"
else
  puts "Enter the number A and H!"
end



