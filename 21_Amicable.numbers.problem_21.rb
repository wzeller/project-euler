=begin
  
Amicable numbers
Problem 21
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000. 
  
=end

#The following code: (1) calculates the sum of the "proper divisors" of all numbers, 2 to 9999, and
#stores them in an array called answers; (2) calculates the sum of the divisors of the sum of the 
#divisors of all numbers (i.e., f(f(x))), 2-9999, (3) checks to see if these two quantities are
#equal (i.e., whether the numbers are "amicable"); and (4) saves amicable numbers to a set and 
#sums them.

#The code gets the right answer, 316236, in 2.3 seconds.

def sum_of_factors_of(number)
  
  require 'mathn'	

  primes, powers = number.prime_division.transpose
 
  #converts the "prime_division" of variable "number," which is a series of arrays
  #of arrays of the form (prime factor, powers), to two new arrays, primes and powers, 
  #which is a tranposition of the rows and columns of prime_division (i.e., 1,1 is the 
  #first prime factor and 1,2 is the first prime powers, and, after tranposition,
  #1,1 is likewise the first prime factor but 2,1 (1,2 transposed) is the first 
  #powers)

  exponents = powers.map{|i| (0..i).to_a}

  #takes each power from the prime factor and creates a new array with all the exponents
  #less than the power, which are used to calculate the divisors

#first takes each element of "exponents" and creates a new array, using product
#function, containing all combos of each of the prime factor exponents with the 
#others (e.g., for 288, the output of exponents.shift.product(*exponents) is all pairs of
#0-5, which is the exponents of 2^5, and 0-2, which is the exponents of 3^2)

#the next section of code takes all the pairs generated in "exponents" and uses them on the 
#prime factors, which are then multiplied together.  This process generates an exhaustive
#and non-duplicative list of divisors.  For example, with 288, first 2^0 * 3^0 is calculated, then 
#2^0 * 3^1, etc., until all pairs have been multiplied.


  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end

#remove the number itself, per the challenge

  divisors.delete_if {|x| x == number}

#add all the divisors (less then number itself) together and return the value

  return divisors.inject(:+)
 
end

def allSumsOfFactors

answers = []

for n in 2..9999
	answers << sum_of_factors_of(n)
end

n = 2
solution = []

while n < 9999

#the following defines j as the sum of the factors of a number, n, which is then used
#as the jth term of the set of sums of factors.  In other words, the sum of the factors of
#210 is the 208th element in answers); so, answers[208] = 284; the second piece checks what the sum
#of the factors of 284 is, which is the 282nd element in answers, or answers[282].  Then it saves
#this number as an integer in variable j, which is 210.  Because, for the example picked, the sum of the factors
#of 210 = 284, and the sum of the factors of 284 = 210 (i.e., j, or 210, is equal to n), 
#the two numbers 210 and 284 are "amicable" and we take the first of them and save it to
#a new array called "solution" (if we saved both, then 210 and 284 would be entered twice, both when)
#n = 210 and n = 284).  The second bit (!= n) eliminates the few situations where the sum of the factors
#of n is equal to n, but NOT to another number.  As a number can only be amicable with another 
#number, these "self-amicable" numbers must be eliminated.


nthSumOfFactors = answers[n-2] #I.e., sum of 284's factors is answer[282], which is 210.

j = answers[nthSumOfFactors - 2] #I.e., sum of 210's factors is answer[208], which is 284.
                                #In other words, j = the sum of the factors of the sum of the
                                #factors of n.  If f(x) is the sum of the factors of x, j = f(f(x)).  

  if j == n && answers [n-2] != numbers #test for "amicability"
    solution << answers[n-2]
  end

n += 1

end

#displays the sum of the amicable numbers

puts solution.inject(:+)

end

allSumsOfFactors

