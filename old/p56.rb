contender, product = 0, 0

(1...100).each do |a|
  (1...100).each do |b|
    product = (a ** b).to_s.split("").map{|n| n.to_i}.reduce(:+)
    contender = product if product > contender
  end
end

puts contender