s = '0.'
(1..300000).each {|n| s += n.to_s}
puts s.length

puts s[2].to_i * s[11].to_i * s[101].to_i * s[1001].to_i * s[10001].to_i * s[100001].to_i * s[1000001].to_i