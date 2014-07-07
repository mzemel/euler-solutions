#Thousand digit fibonacci number

a = 0
b = 1
i = 1
loop do
	i += 1
	c = a + b
	a = b
	b = c
	if c.to_s.length == 1000
		puts i
		break
	end
end