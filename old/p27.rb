require 'prime'

c_primes = 0
c_a = 0
c_b = 0

(-999..999).each do |a|
  (-999..999).each do |b|
    n = 0
    loop do
      break unless Prime.prime? (n**2 + a*n + b)
      n += 1
    end
    if n > c_primes
      c_primes = n
      c_a = a
      c_b = b
    end
  end
end

puts 'a: ' + c_a.to_s + ', b: ' + c_b.to_s + ', n: ' + c_primes.to_s