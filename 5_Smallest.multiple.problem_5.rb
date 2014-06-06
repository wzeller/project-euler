#Smallest multiple
#Problem 5
#2520 is the smallest number that can be divided by each of the numbers
#from 1 to 10 without any remainder.

#What is the smallest positive number that is evenly divisible by all of 
#the numbers from 1 to 20?

#This problem can also be solved by the product of the prime factors multiplied
#by 2^3 * 3 (or 24), as this is what remains after the non-prime factors
#are reduced by the prime factors (2*3*5*7*11*13*17*19*8*3).  However, for sake of practice I wrote
#the following code.  The first function tests for divisibility by 1 to 20.
#The second starts at the product of the primes under 20 and counts up
#by 19s until a number divisible by 1..20 is found.  

#The script takes around 5.8 seconds to find the answer: 232792560.

def divisibleBy1to20?(number)

  #Gets rid of the duplicative factors 
  divisors = [11,13,14,16,17,18,19,20]

  divisors.each do |n|
  	return false if number % n != 0
  end

  true
end

def findSmallestNumberEvenlyDivisibleBy1to20

#The product of primes under 20 (with an is_prime? function, 
#this could be made applicable to any n) is an easy minimum
#to use in starting the search.

  start = 9699690 

  until divisibleBy1to20?(start)
    #Increment by the highest prime factor less than 20. 
    start += 19
  end

  start

end

p findSmallestNumberEvenlyDivisibleBy1to20

