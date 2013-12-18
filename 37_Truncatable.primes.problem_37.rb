=begin

Truncatable primes
Problem 37
The number 3797 has an interesting property. Being prime itself, 
it is possible to continuously remove digits from left to right, 
and remain prime at each stage: 3797, 797, 97, and 7. 
Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left 
to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes. 

=end

#The following code has two methods.  The first generates a list 
#of primes up to a certain number, x, and then removes those 
#numbers that are not potentially truncatable because they start 
#or end with a 1 (1 isn't prime) or contain a 2 in the middle.
#The second cycles through all of the results from the first method
#and tests for right and then left-truncatability and, if both
#tests are passed, stores the results in a solutions array.  Once
#11 solutions are found -- all there are, per solution -- the 
#second method outputs all 11 and their sum.

#This code finds the correct answer -- 748317 -- in 8.3 seconds.

def potentiallyTruncatablePrimesUnderX(x)

# this function generates a list of primes under x and then also a list of numbers
# with the potential to be "truncatable"

numberList = []
numberList = (2..x).to_a

# create a loop that, first, removes the first number's multiples from numberList
# and that loops up to the square root of x

primeList = []


while numberList[0] < Math.sqrt(x)

	primeList << numberList[0]
	y = numberList[0]

	numberList.delete_if {|a| a % y == 0}

end

# now we have two arrays: primeList, which contains all primes up to the square root of x, and numberList
# which contains primes between the square root of x and x
# first we combine them to a single array, primeList, which contains all primes up to x

primeList = primeList + numberList

#this section weeds out numbers that cannot be truncatable from the list
#of primes to have a smaller list to search within

disqualNumbers = [4,6,8,0]
disqualNumberArray = []

for prime in primeList
	primeString = prime.to_s.chars.map(&:to_i)
	primeStringLength = primeString.length
#The first test removes numbers starting or ending with 1, as 1 is not prime, and
#containing 2, as any number ending in 2 cannot be prime.
	if primeString[0] == 1 or primeString[-1] == 1 or primeString[1..primeStringLength] == 2
		disqualNumberArray << prime
	else
#If a number gets by that test, the next looks at whether any digits in the number
#equal 4, 6, 8 or 0, in which case it will also be added to disqualarray.
		for digit in primeString
			digit = digit.to_i
				if disqualNumbers.include?(digit)
					disqualNumberArray << prime
				end
		end
	end
end

#Finally, the set of potential numbers (i.e., numbers that may be right/left or 
#left/right truncatable) is returned by removing those that are disqualified as 
#well as 2,3,5,7, which, per the instructions, cannot be truncatable.

potentialNumbers = primeList - disqualNumberArray - [2,3,5,7]

return primeList, potentialNumbers

end

def isTruncatable?(x)

#There are many queries to the set of primes, but the order doesn't matter,
#which makes sets vastly preferable (using them instead of arrays results 
#in a 5-fold speed increase).

require 'set'

#First run the above method to begin with a set of potentials (as well as a 
#list of primes to test against).

primeList, potentialNumbers = potentiallyTruncatablePrimesUnderX(x)
primeList = primeList.to_set
solutions = []

#Now we subject each potential number to a test for left and right-trucatability.

for x in potentialNumbers

#We use nonPrimes to store any non-primes found during the tests.  If this set 
#is not empty, then we move to the next number.

nonPrimes = []

#These will contain the results of the truncation algorithms.

leftTruncate = []
rightTruncate = []

#Separates each number into separate digits.

stringDigits = x.to_s.chars.map(&:to_i)
length = stringDigits.length
count = 1



#Then test if it is leftTruncatable.  This loop starts with the second digit
#to the last digit and gets progressively smaller.

	while count < length
		leftTruncate << stringDigits[count..-1]
		count += 1
	end

#Now we test whether any of the numbers generated above are non-prime.

	for number in leftTruncate
		number = number.to_s.to_i
#This stores all non-primes into "nonPrimes."
		unless primeList.include?(number)
			nonPrimes << number
		end
	end

#The following loop will not be entered unless there were no non-primes generated
#above (i.e., the left-truncation test was passed).

	if nonPrimes.empty?
	
#Reset the count and empty the nonPrimes array to test for right-truncatability.

		count = 1
		nonPrimes = []

#Same logic as above test, except the first number has the right-most digit 
#removed.

		while count < length
			rightTruncate << stringDigits[0..(-1-count)]
			count += 1
		end

#Again, test all resulting numbers for primeness and save non-primes to "nonPrimes."
		for number in rightTruncate
		number = number.to_s.to_i
		unless primeList.include?(number)
			nonPrimes << number
		end
	end


#The final test will only be true if the initial number is right- and left-
#truncatable.

	if nonPrimes.empty?
		solutions << x
	end

#We stop when the solutions reach 11, which is the number of truncatable numbers in 
#the problem per the problem definition.

	if solutions.size == 11
		break
	end
end

end

#Outputs all right/left truncatable numbers and their sum.

puts solutions
puts solutions.inject(:+)

end

isTruncatable?(1000000)
