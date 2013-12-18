=begin
	
Circular primes
Problem 35
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
	
=end

#Below are two methods to solve this.  The first generates a list of primes up to a certain 
#number, x.  The second weeds out all numbers with an even or 5 digit and tests 
#all rotations for primeness and outputs the number of circulars below a number
#x.  

#My code takes 6.7 seconds to find the right answer, 55.

def primesLessThanX(x)

#First we generate list of numbers 2 through x.

numberList = (2..x).to_a

# Next we create a loop that, first, removes the first number's multiples from numberList
# and that loops up to the square root of x.  This is the Sieve of Aristosthenes.

primeList = []

while numberList[0] < Math.sqrt(x)

	primeList << numberList[0]
	y = numberList[0]

	numberList.delete_if {|a| a % y == 0}

end

# Now we have two arrays: primeList, which contains all primes up to the square root of x, and numberList
# which contains primes between the square root of x and x.
# We combine them to a single array, primeList, which contains all primes up to x.

primeList = primeList + numberList

return primeList

end

def testForCircularity(x)

#This method will tell you how many circular numbers there are less than x

require 'set'

#First we import primes less than x from sieve above.

primeList = primesLessThanX(x)

#Next we define variables.

numberOfCirculars = 0

circularNumberArray = Set.new

#To make this efficient, first we remove all primes containing any even number (above single-digit), or 5, 
#as they will contain at least one non-prime rotation.  Thus we convert each prime to string, reject any elements
#including evens or fives, then turn it back into integers.  We store this list as a set because it's slightly faster.

primeList = primeList.map {|i| i.to_s}

primeList.reject! {|item| item.to_i > 10 && (item.include?("2") || item.include?("4") || item.include?("5") || item.include?("6") || item.include?("8")) }

primeList = primeList.map {|s| s.to_i}.to_set

#Now we have a list of primes without any containing even numbers or 5.  The next step is to check whether 
#each prime is "circular," or contains primes for all rotations.

for prime in primeList

#We create a string to easily generate -- and test for primeness -- all circulars.

	s = prime.to_s
	index = 0

#The easiest algorithm to get all circulars is to create two copies of the number:

	solutions = (s + s).split('')

#And then cycle through the copy of the number, starting with [0]..size and continuing 
#to the end of the number (the each_cons method gives each consecutive slice), and then 
#mapping the resulting slices to an array from which we revove the last entry (as that will
#be a duplicate of the first).

	solutions = solutions.each_cons(s.size).map(&:join)[0..-2]

#Then we convert each of the numbers to an integer.
	solutions = solutions.map {|s| s.to_i}

#Next we cycle through each rotation and determine if they are in the list
#of primes.

			for number in solutions
	
				if primeList.include?(number.to_i)

#If so, we increment index by 1.

					index += 1

#The following line will only be true if every rotation is prime or, in other words,
#the number is "circular."
					if index == s.size
#Use this variable to keep track of how many circulars there are.
						numberOfCirculars += 1
					end
				
				end
			end

end

puts "There are"
puts numberOfCirculars
puts "circulars below"
puts x

end

testForCircularity(1000000)