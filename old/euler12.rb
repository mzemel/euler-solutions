class Integer
 def factors()
   1.upto(Math.sqrt(self)).select {|i| (self % i).zero?}.size
 end
end

i=1000000000000000000

until i.factors > 499 do
  i+=1
end

puts i
