=begin
Triangular, pentagonal, and hexagonal
Problem 45
Triangle, pentagonal, and hexagonal numbers are generated by the 
following formulae:

Triangle	 	Tn=n(n+1)/2	 	1, 3, 6, 10, 15, ...
Pentagonal	 	Pn=n(3n−1)/2	 	1, 5, 12, 22, 35, ...
Hexagonal	 	Hn=n(2n−1)	 	1, 6, 15, 28, 45, ...

It can be verified that T285 = P165 = H143 = 40755.

Find the next triangle number that is also pentagonal and hexagonal.	
	
=end

#The key to this is finding out where to stop the search.  I first 
#tried the first 50,000 of each number but there were no more
#solutions.  There is with 100,000, however.  

def triPentHexFinder

#Using sets makes this brute force solution -- ridiculously slow using 
#arrays -- extremely fast -- finds solution in 2.9 seconds.

require 'set'

triangulars = (1..100000).map { |n| n*(n+1)/2}.to_set
pentagonals = (1..100000).map { |n| n*(3*n-1)/2}.to_set
hexagonals = (1..100000).map { |n| n*(2*n-1)}.to_set

#This simply checks if any of the triangulars are also in both other
#categories AND larger than 40755 and outputs the solution.

puts triangulars.to_a.select {|a| pentagonals.include?(a) && hexagonals.include?(a) && a > 40755}

end

triPentHexFinder