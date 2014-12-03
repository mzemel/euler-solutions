class Problem
    attr_accessor :multiples_string, :contender

    def check (val, i)
        set_multiples_string val, i
        self.contender = multiples_string.to_i if multiples_string.length == 9 && multiples_string.to_i > contender.to_i && pandigital?
    end

    def set_multiples_string (val, i)
        self.multiples_string = ''
        (1..i).each {|j| self.multiples_string += (val*j).to_s; return false if multiples_string.length > 9}
    end

    def pandigital?
        (1..9).each {|n| return false if !multiples_string.match /#{n}/}
        true
    end
    
    def current_value
        multiples_string.to_i if pandigital?
    end
end

herman = Problem.new

(1..9).each do |i|
    (1..10000).each {|val| herman.check val, i}
end

puts herman.contender