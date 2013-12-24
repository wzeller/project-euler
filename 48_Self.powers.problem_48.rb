=begin

Self powers
Problem 48
The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.	
	
=end

#Very simple code that cycles through the numbers 1-1000, adds each
#number ** number to sum, then converts the sum to string and prints 
#out the last 10 digits of it.

#My code finds the solution -- 9110846700 -- in .1 seconds.

def selfPowers

sum = 0

for n in (1..1000)

	sum += n ** n

end

puts sum.to_s[-10..-1]

end

selfPowers
