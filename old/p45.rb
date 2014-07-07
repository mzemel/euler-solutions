triangle_numbers, pentagonal_numbers, hexagonal_numbers = [], [], []

(1..100000).each do |i|
	triangle_numbers << (i * (i + 1) / 2)
	pentagonal_numbers << (i * (3*i - 1) / 2)
	hexagonal_numbers << (i * (2*i - 1))
end

puts (triangle_numbers & pentagonal_numbers & hexagonal_numbers).last