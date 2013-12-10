=begin

Quadratic primes
Problem 27
Euler discovered the remarkable quadratic formula:

n² + n + 41

It turns out that the formula will produce 40 primes for the consecutive 
values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 
is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly 
divisible by 41.

The incredible formula  n² − 79n + 1601 was discovered, 
which produces 80 primes for the consecutive values n = 0 to 79. 
The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

n² + an + b, where |a| < 1000 and |b| < 1000

where |n| is the modulus/absolute value of n
e.g. |11| = 11 and |−4| = 4
Find the product of the coefficients, a and b, 
for the quadratic expression that produces the maximum number of 
primes for consecutive values of n, starting with n = 0.
  
=end

#My solution to this problem contains three methods.  The first tests
#whether a number is prime.  The second takes the arguments a and b
#and determines how many consecutive primes are produced starting with
#0 in an equation of the form n² + an + b.  The third tests all a and
#b pairs from -1000 to 1000 and outputs the product of the pair (a and b) that 
#produces the longest sequence.

#My code finds the answer (-59231) in 29.4 seconds.

#The following is a simple method that tests all integers
#2..square root of a number and determines whether the 
#number is divisible by them.  If so, (or if the number is less than 
#or equal to 1), it is not prime.
#If not, it is prime.

def isPrime?(number)
  i = 2
  if number <= 1
  	return false
  end
  y = Math.sqrt(number)

  while i < y
    if number % i == 0
        return false
    end
    i += 1
  end
return true
end

#This method takes a and b, calculates the number of consecutive
#primes, and returns that along with a*b.

def numberOfPrimes?(a, b)

solutions = []
n = 0
answer = (n ** 2) + (a * n) + b
count = 0

#This loop continues as long as each element produces a prime
#number.  Count keeps track of how many consecutive primes
#result.

		while isPrime?(answer) == true	
			count += 1
			n += 1	
			answer = (n ** 2) + (a * n) + b
		end

#We already know that a certain sequence produces 40 primes, so the
#answer must be equal to or greater than this.  This speeds up the 
#method.

if count - 1 >= 40

  solutions << count - 1
  solutions << a * b

end

return solutions

end

#This method simply loops through a and b between -1000 and 1000 and 
#returns the product of a and b associated with the longest sequence
#of primes.

def rangeOfQuadPrimes

a = -1000
b = -1000
solutionsToo = []

while b < 1000

while a < 1000
	solutionsToo << numberOfPrimes?(a, b)
	a += 1
end

a = -1000
b += 1

end

puts "When a * b = #{solutionsToo.max[1]}, there are #{solutionsToo.max[0]} consecutive"
puts "primes produced, for n 0 to #{solutionsToo.max[0] - 1}." 

end

rangeOfQuadPrimes