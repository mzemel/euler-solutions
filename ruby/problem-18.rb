def total_days
	total = 0
	for i in (1901..1999) do
		if i % 4 == 0
			total += 366
		else
			total += 365
		end
	end
	total
end

def thirtyone_day_month (val)
	(31 + val) % 7
end

def thirty_day_month
end

def twentynine_day_month
end

def twentyeight_day_month
end

puts total_days / 7