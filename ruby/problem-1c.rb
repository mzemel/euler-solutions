@sum = 0

def check_num(val)
  return true if val % 3 == 0 || val % 5 == 0
end

def add_number(val)
  @sum += val
end

(1...1000).each do |i|
  if check_num i
    add_number i
  end
end

puts @sum
