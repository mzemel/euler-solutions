products = []

array = ['1','2','3','4','5','6','7','8','9']

array.each do |a|
  (array - [a]).each do |b|
    (array - [a,b]).each do |c|
      (array - [a,b,c]).each do |d|
        (array - [a,b,c,d]).each do |e|
          (array - [a,b,c,d,e]).each do |f|
            (array - [a,b,c,d,e,f]).each do |g|
              (array - [a,b,c,d,e,f,g]).each do |h|
                i = (array - [a,b,c,d,e,f,g,h]).first
                if (a+b).to_i * (c+d+e).to_i == (f+g+h+i).to_i || (a).to_i * (b+c+d+e).to_i == (f+g+h+i).to_i
                  products.push (f+g+h+i).to_i
                end
              end
            end
          end
        end
      end
    end
  end
end

puts products.uniq.inject(:+)