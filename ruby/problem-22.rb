class String
  def name_score()
    sum = 0
    self.split("").each {|c| sum += c.ord - 64 }
    sum + 60
  end
end

file = File.open('names.txt','r')
true_sum = 0
i = 0
file.read.split(",").sort.each {|n| i+=1; true_sum += (i * n.name_score) }
#file.read.split(",").sort.each {|n| i+=1; print n.inspect if n.include? "COLIN"; puts i.to_s + n.name_score.to_s if n.include? "COLIN"}
puts true_sum
