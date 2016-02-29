def kaprekar?(k)
  return true if k==1
  ks = (k**2).to_s
  lenf = (ks.length) - 1
  leni = (ks.length / 2) - 1
  a = ks[0..leni].to_i
  b = ks[leni+1..lenf].to_i
  k == (a+b)
end

range1 = gets.strip.to_i
range2 = gets.strip.to_i

a = (range1..range2).select {|x| kaprekar?(x)}
a.empty? ? (print "INVALID RANGE") : (a.each {|a| print "#{a} "})
