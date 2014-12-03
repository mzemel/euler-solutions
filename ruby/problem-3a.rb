# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

class FactorSet
    include Enumerable
    attr_accessor :arr

    def initialize(init = nil)
        self.arr = []
        arr.push(init) if init
    end
    def permits?(arg)
        arr[1..-1].each do |el|
            break nil if ( arg % el == 0)
        end
    end
    def push(arg)
        arr.push(arg)
    end
    def last
        arr.last
    end
end

class ProblemSolver
    attr_accessor :small, :large, :bignum

    def initialize(bignum)
        self.small = FactorSet.new(1)
        self.large = FactorSet.new(bignum)
        self.bignum = bignum
    end
    def perform
        iterate
        puts answer
    end
    def iterate
        (2..bignum).each do |i|
            break if i > large.last
            rem = bignum % i
            if rem == 0
                quotient = bignum / i
                large.push(quotient)
                small.push(i) if small.permits?(i)
            end
        end
    end
    def answer
        large.arr.select{|el| small.permits?(el)}.first || small.last
    end
end

p = ProblemSolver.new(6008514751433)
p.perform