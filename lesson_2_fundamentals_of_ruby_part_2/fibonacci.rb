fib = []
fib[0] = 0
fib[1] = 1
i = 1

while fib[i] < 100 - fib[i - 1]
  i += 1
  fib[i] = fib[i - 1] + fib[i - 2]
end
p fib
