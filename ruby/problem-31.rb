=begin
In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1£1 + 150p + 220p + 15p + 12p + 31p
How many different ways can £2 be made using any number of coins?
=end

combos = 1 # including the 1 2pound coin
(0..2).each do |one_l|
  (0..4).each do |fifty_p|
    break if 50*fifty_p + 100*one_l > 200
    (0..10).each do |twenty_p|
      break if 20*twenty_p + 50*fifty_p + 100*one_l > 200
      (0..20).each do |ten_p|
        break if 10*ten_p + 20*twenty_p + 50*fifty_p + 100*one_l > 200
        (0..40).each do |five_p|
          break if 5*five_p + 10*ten_p + 20*twenty_p + 50*fifty_p + 100*one_l > 200
          (0..100).each do |two_p|
            break if 2*two_p + 5*five_p + 10*ten_p + 20*twenty_p + 50*fifty_p + 100*one_l > 200
            (0..200).each do |one_p|
              break if 1*one_p + 2*two_p + 5*five_p + 10*ten_p + 20*twenty_p + 50*fifty_p + 100*one_l > 200
              combos += 1 if 1*one_p + 2*two_p + 5*five_p + 10*ten_p + 20*twenty_p + 50*fifty_p + 100*one_l == 200
            end
          end
        end
      end
    end
  end
end
puts combos

=begin


(0..2).each do |five_p|
  break if 5*five_p > 10
  (0..5).each do |two_p|
    break if 2*two_p + 5*five_p > 10
    (0..10).each do |one_p|
      break if 1*one_p + 2*two_p + 5*five_p > 10
      combos += 1 if 1*one_p + 2*two_p + 5*five_p == 10
    end
  end
end


    
2 fives (1)
1 five (3)
  2 twos, 1 one
  1 two, three ones
  5 ones
0 fives (6)
  5 twos
  4 twos, 2 ones
  3 twos, 4 ones
  2 twos, 6 ones
  1 two, 8 ones
  0 twos, 10 ones




=end