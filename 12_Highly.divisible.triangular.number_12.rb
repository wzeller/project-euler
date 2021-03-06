=begin

Highly divisible triangular number
Problem 12
The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

 1: 1
 3: 1,3
 6: 1,2,3,6
10: 1,2,5,10
15: 1,3,5,15
21: 1,3,7,21
28: 1,2,4,7,14,28

We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred divisors?

=end

#The code below finds the solution (76576500) in .3 seconds by using an initial screen to find
#triangle numbers divisible by the 4 smallest primes (2,3,5,7) and only then testing
#for number of factors.  Prescreening for divisibility by small primes increases
#speed by several orders of magnitude.  The logic is that the smallest number with
#500 factors necessarily has the smallest prime factors, and using the first four
#is a conservative estimate.

require 'mathn'

def findFirstTriangleNumberWithOverNDivisors(divisors)

  a = 1
  b = 0
  x = 0

  #First we generate triangle numbers.  

  #Then we test for divisibility by 2, 3, 5 and 7, the first 
  #four prime numbers.  Given we are looking for the smallest number with 500 factors,
  #it necessarily must be divisible by the samllest prime factors, 2, 3, 5, and 7. (If there is no screening, 
  #it takes around a second).

  #Only those numbers that are triangle and divisible by the first 4 primes
  #are tested for number of factors.  To do we usethe prime_division method, 
  #which is a multidimensional array with each entry containing the prime factor 
  #and the power (e.g., [0][0] = lowest prime factor, and [0][1]= the exponent of that factor).  The code below sets
  #b equal to the prime division of x, which is the triangle number being tested, 
  #and then adds 1 to each of the "power" entries (i.e., the[n][1] of each element),
  #then multiplies the resulting numbers together.  This is the formula to determine
  #the number of distinct factors from the prime factorization.

  until !b.nil? && b > divisors
    x = (a*(a+1))/2
    
    if x%2 == 0 && x%3 == 0 && x%5 == 0 && x%7 == 0 
      b = x.prime_division.map {|arr| arr[1]+1}.inject(:*)
    end

    a += 1
  end

  puts x 

end

findFirstTriangleNumberWithOverNDivisors(500)
