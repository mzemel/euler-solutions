puts [0,1,2,3,4,5,6,7,8,9].permutation.map{|p| p.join}.map{|p| p.to_i if p[1..3].to_i % 2 == 0 && p[2..4].to_i % 3 == 0 && p[3..5].to_i % 5 == 0 && p[4..6].to_i % 7 == 0 && p[5..7].to_i % 11 == 0 && p[6..8].to_i % 13 == 0 && p[7..9].to_i % 17 == 0}.compact.inject(:+)