require 'prime'

class Integer
	def pandigital?
		(1..self.to_s.length).each {|l| return false if !self.to_s.match /#{l}/}
		true
	end
end

class Array
	def uniq?
		self.length == self.uniq.length
	end
end

highest = 0


Prime.each(1000000000) do |p|
	highest = p if p.to_s.split("").uniq? && p.pandigital?
end

puts highest