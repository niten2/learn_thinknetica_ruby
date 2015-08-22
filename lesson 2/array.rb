# Заполнить массив числами от 10 до 100 с шагом 5

array = (10..100).to_a
array.delete_if {|x| x % 5 != 0  }
p array
