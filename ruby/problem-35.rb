require 'prime'

start = Time.now

primes = [] #array of primes as strings
Prime.each(1000000) {|p| primes << p.to_s}
circulars = []

class String
  def rotate!()
    self[self.size] = self[0]
    self.replace self[1..-1]
    self
  end
end


primes.each do |n|
  #Problem: Need to be able to skip calling it if we already know a rotation of it isn't prime
  #Something like: next if skippables.include? n
  beerake = false
  temp_array = [n.to_i]
  (n.size - 1).times do
    if n.rotate!.to_i.prime?
      temp_array << n.to_i unless temp_array.include? n.to_i
      #Something like: skippables << n.to_i
    else
      #Or even... primes -= temp_array
      beerake = true
    end
  end
  next if beerake
  circulars += temp_array
end

puts "There are #{circulars.uniq.length} combinations."
puts "Solved in #{Time.now - start} seconds."
puts circulars.uniq.inspect