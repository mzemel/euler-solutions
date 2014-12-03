#################
### structure is
###
### 49/  =   4/
###  98   =   8

require 'set'

aa, bb, cc = ('1'..'9'), ('1'..'9'), ('1'..'9')

num, den = 1, 1
@num, @den, @gcf = 1, 1, 1

def s(x,y) #floatify!
  (x+y).to_f
end

count = 0

aa.each do |a|
  bb.each do |b|
  	cc.each do |c|
  	  #puts "#{a+c}/#{c+b}"

      if s(a,c)/s(c,b) == (a.to_f/b.to_f) && s(c,b) >= s(a,c) && a != c && c != b
      	puts "#{a+c} / #{c+b}"
        num *= (a+c).to_i
        den *= (c+b).to_i
        count += 1
      end

    end
  end
end

puts "#{@num} over #{@den} in #{count} ways" #still don't have reduced fraction

class Integer
  def factors
    factors = []
    (1..(Math.sqrt self).to_i).each do |i|
      if self % i == 0
      	factors << i
      	factors << self/i
      end
    end
    factors.sort.uniq
  end
end

def gcf (num, den)
  @gcf = 1
  num.factors.each do |f|
    if den % f == 0 && num > f
      @num = num / f
      @den = den / f
      @gcf *= f
    end
  end
end

gcf num, den

puts "#{@num / @gcf} over #{@den / @gcf}; gcf: #{@gcf}"