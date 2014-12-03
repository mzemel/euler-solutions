require 'set'

(100000...200000).each do |i|
  puts i if i.to_s.split("").to_set == (2*i).to_s.split("").to_set && i.to_s.split("").to_set == (3*i).to_s.split("").to_set && i.to_s.split("").to_set == (4*i).to_s.split("").to_set && i.to_s.split("").to_set == (5*i).to_s.split("").to_set
end