=begin
21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13
=end

#one branch's value at i from origin is 1 + %w(2, 4, 6, 8) + 8*(i-1)

#sum each direction from i in (1..500)

# 0   1    2    3
# 1   3   13   31
# 1 + 2 + 10 + 18 + 26 ...
# 1 + 2 + 8 * (i-1)

total = 1

[2,4,6,8].each do |b|
  (1..500).each do |i|
    total += 1 + (1..i).map{|j| b + 8 * (j-1)}.inject(:+)
  end
end

puts total