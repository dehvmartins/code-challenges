def  pairs( a,k)
  h = Hash[a.zip (0..a.size-1)]
  a = a.sort
  answer = a.select {|i| h[i+k] }
  puts answer.size
end

k = gets.strip.split(" ").map! {|i| i.to_i}.last
b = gets.strip.split(" ").map! {|i| i.to_i}

puts pairs(b,k)
