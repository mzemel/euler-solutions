#If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

#Find the sum of all the multiples of 3 or 5 below 1000.

the_multiples = []

(1...1000).each do |i|
	if i % 3 == 0 || i % 5 == 0
		the_multiples << i
	end
end

j = 0

the_multiples.each do |k|
	j += k
end

puts j