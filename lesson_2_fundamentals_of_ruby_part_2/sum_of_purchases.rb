basket    = {}
sum       = 0
final_sum = 0

loop do
  puts 'Введите название товара или stop для выхода'
  name = gets.chomp
  break if name.downcase == 'stop'

  puts 'Введите цену товара'
  cost = gets.chomp.to_f

  puts 'Введите количество товара'
  count = gets.chomp.to_f

  sum           = cost * count
  basket[name]  = { cost => count }
  final_sum += sum

  puts "Сумма за текущий товар = #{sum}"
  puts "Хэш содержит #{basket}"
  puts "Сумма за все покупки в корзине = #{final_sum}"
end
