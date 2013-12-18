
=begin
	
Pandigital prime
Problem 41
We shall say that an n-digit number is pandigital 
if it makes use of all the digits 1 to n exactly once. 
For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
	
=end

#My solution is two methods.  The first tests whether a 
#number is prime. The second finds all 7-digit pandigitals,
#sorts from largest to smallest, and prints the first 
#prime found.  Because 8 and 9 digit pandigitals have
#digits summing to a multiple of 3, they cannot be prime,
#thus the largest must be 7-digits.

#My code finds the answer -- 7652413 -- in 0.0 seconds.

def is_prime(n)

if n == 2 
	return true
end

for number in 2..Math.sqrt(n)
	if n % number == 0
		return false
	end
end

return true

end

def largestPandigitalPrimeFinder

#We use 7 digit pandigitals, 
#as the digits of 8 and 9 digit pandigitals sum
#to a number divisible by 3 and thus cannot be prime.

#First find all permutations of 1-7 and join them to 
#an array.
pandigitals = (1..7).to_a.permutation(7).map {|arr| arr.join} 

#Next sort the array of pandigitals largest to smallest.
pandigitals = pandigitals.sort! {|x,y| y<=>x}

#Finally, starting with the largest, cycle through and 
#output and return the first prime number.
for number in pandigitals

	number = number.to_i

	if is_prime(number) == true
		puts number
		return number
	end

end

end

largestPandigitalPrimeFinder
