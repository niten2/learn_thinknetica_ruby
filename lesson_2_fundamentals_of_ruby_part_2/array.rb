array = (10..100).to_a
array.delete_if { |x| x % 5 != 0 }
p array
