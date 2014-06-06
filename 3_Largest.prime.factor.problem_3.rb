#Largest prime factor
#Problem 3
#The prime factors of 13195 are 5, 7, 13 and 29.

#What is the largest prime factor of the number 600851475143?

#I use ruby's function called prime_division to find the prime factors (and their 
#exponents) for the number.  The function returns a multi-dimensional array 
#with pairs of primes and their exponent powers. The max of this array returns 
#the highest prime/exponent pair, and the first entry gives us the highest prime.

#The code produces the answer, 6857, in 0.0 seconds.  

require 'mathn'

def largestPrimeFactorOfN(n)

  n.prime_division.max.first 

end

p largestPrimeFactorOfN(600851475143)
