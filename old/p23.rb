class Integer
  def is_abundant?()
    self.factors_sum > self ? true : false
  end
  def factors_sum()
    sum = 1
    (2..Math.sqrt(self).floor).each {|i| self % i == 0 ? sum += (i + self/i) : nil}
    Math.sqrt(self).floor == Math.sqrt(self) ? sum -= Math.sqrt(self).to_i : nil #false necessary?
    sum
  end  
end

abundants = (1...28124).select{|n| n.is_abundant?}

all_possible_sums = []

abundants.each do |a|
  abundants.each do |b|
    break if a + b > 28123
    all_possible_sums.push a + b# unless all_possible_sums.include? a + b
  end
end

#puts all_possible_sums.size

#puts all_possible_sums.uniq {|x| x}.sort

aps = all_possible_sums.uniq {|x| x}

ais = (1..28123).select{|x| !aps.include? x}

puts ais

puts ais.inject(:+)






=begin
cant_be_achieved = [] #impossible_sums
(1..28124).each_with_index do |n, i|
  if abundant[i]
  sum = abundant + abundant[i+1]
  unless cant_be_achieved.include? sum
    cant_be_achieved.push sum
  #break if cant_be_achieved.include? first_abundant
  #cant_be_achieved.push first_abundant * second_abundant
end
# 1 to 18112 

puts abundants

puts cant_be_achieved.last
puts cant_be_achieved.inject(:+)
=end















#there should be a function that returns all abundant numbers

#if size of array squared is reasonable, select the smallest sum of all possible abundant number combinations
