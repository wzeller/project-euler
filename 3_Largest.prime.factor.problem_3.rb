#Largest prime factor
#Problem 3
#The prime factors of 13195 are 5, 7, 13 and 29.

#What is the largest prime factor of the number 600851475143?

def largestPrimeFactorOfN(n)

require 'mathn'

#I use ruby's function called prime_division to find the prime factors (and their 
#exponents) for the number.  The function returns a multi-dimensional array 
#with pairs of primes and their exponent powers.  
#I use the transpose method, which switches the rows and columns.  
#In other words, it changes a matrix of [a , b]  to [a, c]
#                                       [c,  d]     [b, d]
#
#This allows separating out the primes into a separate array.
#Then I print the highest number in the resulting array.
#
#The code produces the answer, 6857, in 0.0 seconds.  

primes, powers = n.prime_division.transpose

puts primes.max

end

largestPrimeFactorOfN(600851475143)
