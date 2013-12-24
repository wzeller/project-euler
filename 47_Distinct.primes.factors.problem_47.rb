=begin
Distinct primes factors
Problem 47
The first two consecutive numbers to have two distinct 
prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three 
distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four 
distinct prime factors. What is the first of these numbers?
=end

#My solution contains two methods.  The first generates a list
#of primes up to a certain number.  The second does several things
#with that list of primes.  First it generates an array of length 1+n
#for a certain range 1-n, in which we will search for the four numbers
#with four distinct prime factors.  Next it cycles through the list
#of prime numbers and adds one to each index of the array it lands on.
#So, for example, the first number is 2, which adds one to the new array
#at index numbers 4, 6, 8...n+1.  After the primes are finished 
#cycling, we have a list with the number of prime factors as the 
#value and the number itself as the index.  (E.g., at index 6 there are
#two prime factors, so the value of the array at index 6 is 2).  The final
#step is to go through the new array using the each_with_index method
#and, whenever a value of greater than 4 is reached (meaning that number has
#more than 4 prime factors), the loop looks at whether the next 3 numbers
#are also greater than four (i.e., a solution is reached).  If they are, 
#the loop prints out the index number of the first number and breaks, as 
#a solution has been found.  

#Using 1,000,000 as the starting point, the code
#takes 9.8 seconds to find the correct solution -- 134,043.

#First method finds primes up to x and returns that array.

def primesUnderX (x)

#This is a tweaked version of earlier program to return the primes and composites
#lower than a number, x.

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

primeList = (primeList + numberList)

return primeList

end

#Second method generates list with number of factors for each number
#up to n and identifies first string of 4 consecutive numbers with
#4 distinct factors.

def findConsecutiveNumbersWithConsecutivePrimesUpToN(n)

#First we run the above method for list of primes.
primes = primesUnderX(n)

#The array with the list of factors will be called "composites."
composites = []

#First populate composites with n+1 0s so the next loop can 
#add to them.
elements = 0

until elements == n + 1

	composites << 0
	elements += 1

end

#This is the most important loop in the method.  It works by going through
#each prime number up to n and adding 1 to each of its multiples in the
#array composites.  When finished, each index in composites is equal to 
#a number, with the value being the number of distinct prime factors.  This
#is similar to the sieve of erastothenes, except it keeps track of factors
#rather than identifies non-primes.  

for prime in primes

#The multiple is incremented until the prime * multiple is larger than
#n.

	multiple = 2

#This inner loop cycles until prime * multiple is greater than n, in which
#case the code will go to the next prime.

	while prime * multiple < n + 1

		a = prime * multiple

		if a <= n
#Here we see that the index of composites equal to a prime*multiple
#is incremented for every new prime factor.

			composites[a] += 1
		end

#The multiples keep going up till the above test -- prime * multiple < n + 1 --
#fails.

		multiple += 1
	end

end

#This is the last step.  Here we go through every element in the composites
#array; take the factors (i.e., value) and number (i.e., index); see whether
#factors >= 4 and, if so, whether the next 3 numbers also have factors over 4; 
#and, if so, print the first number (i.e., the index of the first value of 4) 
#and break, as the solution has been found.

composites.each_with_index do |factors, number|

	if factors >= 4 && composites[number+1] >= 4 && composites[number+2] >= 4 && composites[number+3] >= 4
		puts number
		break
	end

end


end

findConsecutiveNumbersWithConsecutivePrimesUpToN(1000000)