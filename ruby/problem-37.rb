require 'prime'

@good = []

def check_right (val)
  while val > 0 do
    if val.prime?
      val = val.to_s.chop.to_i
    else
      return false
    end
  end
  return true
end

def check_left (val)
  while val > 0 do
    if val.prime?
      val = val.to_s.reverse.chop.reverse.to_i
    else
      return false
    end
  end
  return true
end

(1..1000000).each do |i|
  if (check_right i) && (check_left i)
    @good << i
  end
end

puts @good.map{|element| element if element.to_s.length > 1}.compact.inject(:+)
