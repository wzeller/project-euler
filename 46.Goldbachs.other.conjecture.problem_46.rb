def compositesAndPrimesUnderX (x)

#This is a tweaked version of earlier program to return the primes and composites
#lower than a number, x.

require 'set'

# Generate list of numbers 2 through x.

numberList = (2..x).to_a

# Create a loop that removes the first number's multiples from numberList
# and that loops up to the square root of x.

primeList = []

while numberList[0] < Math.sqrt(x)

	primeList << numberList[0]
	y = numberList[0]

	numberList.delete_if {|a| a % y == 0}

end

# Now we have two arrays: primeList, which contains all primes up to the square root of x, and numberList
# which contains primes between the square root of x and x.
# Thus we combine them to a single array, primeList, which contains all primes up to x.

primeList = (primeList + numberList).to_set

# Now we create a set of numbers NOT in primeList (i.e., composites) and that are odd.

oddComposites = (1..x).select {|n| primeList.include?(n) == false && n.odd?}

return primeList, oddComposites

end

def checkIfTwoTimesSquare(number)

#Tests whether a number can be rewritten as 2 * n^2

	half = number.to_f/2
	square = Math.sqrt(half)

#The following tests if half of a number has a whole number square root.
	if square == square.to_i.to_f
		return true

#If not, it cannot be written as 2 * n^2.	
	else
		return false
	end

end

def goldbachsCheck(number)

#This function checks all numbers up to a certain limit for whether they 
#satisfy Goldbach's conjecture by checking whether each odd composite 
#can be expressed in the form prime + (2 * x^2).

require 'set'
#Sets are much faster than arrays given the multiple queries of primeList.

primeList, oddComposites = compositesAndPrimesUnderX(number)
primeList = primeList.to_a.to_set
oddComposites.delete(1)

for numberA in oddComposites

#We cycle through all oddComposites and see whether they can be rewritten
#in Goldbach form with a second loop below.  

test = numberA

#First we define a working variable "test" that will be 
#used to test different primes that could be used to 
#rewrite the odd composite in Goldbach form.  
#We do this by looking at each number less than the
#odd composite (i.e., composite - "test").  If test is prime and the difference between composite and 
#test can be expressed as 2 * n ^ 2, then the conjecture holds. 
#If, after test reaches 1, no number fits both criteria, we return the exception,
#which disproves Goldbach's conjecture.

#There was no disproof in the first 1000, so I tried 100,000, which found the answer.

until primeList.include?(test) && checkIfTwoTimesSquare(numberA-test)

#There are two tests: first whether "test" is prime, then if the difference
#between the odd composite and test could be rewritten as two times a 
#number squared.  The following loops until either the tests are satisfied or 
#test == 0 then returns to the main for loop.

	test -= 1

	if test == 0
		puts "False because"
		puts numberA
		puts "cannot be written"
		return numberA
	end
end

end

end

goldbachsCheck(100000)
