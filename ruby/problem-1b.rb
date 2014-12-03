multiples_of_3 = []
multiples_of_5 = []

i, j = 1, 1

while 3*i < 1000 do
  multiples_of_3 << 3*i
  i += 1
end

while 5*j < 1000 do
  multiples_of_5 << 5*j
  j += 1
end

puts (multiples_of_3 + multiples_of_5).uniq.inject(:+)
