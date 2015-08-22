# Заполнить массив числами фибоначи до 100

fib = []
fib[0] = 0
fib[1] = 1
i = 1

while fib[i] < 100 - fib[i-1]
  i +=1
  fib[i] = fib[i-1] + fib[i-2]
end
p fib


# Другие варианты

# 1
# def fibonacci(n)
#     if n < 3
#         1
#     else
#         fibonacci(n - 1) + fibonacci(n - 2)
#     end
# end

# (1..16).each {|n| puts "#{fibonacci(n)}, "}
# puts "..."

# 2
# def fib(n)

#   return n if n < 2

#   a, b = 0, 1
#   for i in 2 .. n
#      a, b = b, a+b
#   end
#   b
# end
# puts fib(100)

# 3
# Массив будем вводить в виде строки с пробелами, например 1 4 5 4 6 8 12 34

# print "Вводи числа: "

# ar = gets.split.map{ |str| str.to_i } # На выходе массив челых чисел

# class Integer # Добавление методов к встроенному классу (вызов 556.fib?)

#    def fib # ищет число Фибоначи, меньшее self
#       n1, n2 = 1, 1
#       while n2 < self
#             n1 += n2
#             n1, n2 = n2, n1 # обмен значениями
#       end
#       n2 # возврат значения
#   end

#   private :fib

#   def fib? # проверка на то, что число является числом Фибоначи
#      self == self.fib
#   end

# end


# 4
# def fib(n)
#   (@d ||= [1,1])[n] ||= (
#     fib(n-1) + fib(n-2)
#   )
# end

# 5
# fib = []
# fib[0] = 0
# fib[1] = 1
# i = 1
# while fib[i] < 100 - fib[i-1]
#   i +=1
#   fib[i] = fib[i-1] + fib[i-2]
# end
# p fib
