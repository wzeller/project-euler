#Smallest multiple
#Problem 5
#2520 is the smallest number that can be divided by each of the numbers
#from 1 to 10 without any remainder.

#What is the smallest positive number that is evenly divisible by all of 
#the numbers from 1 to 20?

#This problem can also be solved by the product of the prime factors multiplied
#by 2^3 * 3 (or 24), as this is what remains after the non-prime factors
#are reduced by the prime factors.  However, for 

def divisibleBy1to20?(number)

#Gets rid of the duplicative factors 
divisors = [11,13,14,16,17,18,19,20]

for n in divisors
	if number % n != 0
		return false
	end
end

return true
end

def findSmallestNumberEvenlyDivisibleBy1to20

#The product of primes under 20 (with an is_prime? function, 
#this could be made applicable to any n) is an easy minimum
#to use in starting the search.

test = 9699690 

until divisibleBy1to20?(test) == true

#We increment by the highest prime factor less than n. 

test += 19

end

puts test

end

findSmallestNumberEvenlyDivisibleBy1to20

