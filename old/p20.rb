class Integer
  def factors_sum()
    sum = 0
  	(2...Math.sqrt(self).floor).each do |i|
  	  if self % i == 0
  	  	sum += i
  	  	sum += self / i
  	  end
  	end
  	sum += 1
  	if Math.sqrt(self).floor == Math.sqrt(self)
  	 	sum += Math.sqrt(self).to_i
  	end
  	sum
  end
end

am_sub = 0

for i in (2...10000)
	for j in (2...10000)
		if j.factors_sum == i && i.factors_sum == j && j != i
			#puts i.to_s + ", " + j.to_s
			am_sub += j
		end
	end
end

puts am_sub