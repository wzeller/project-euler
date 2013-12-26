=begin

Consecutive prime sum
Problem 50
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, 
contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?	

=end

#My solutions uses three methods.  The first two are from prior exercises.  The first 
#generates a list of primes up to x.  The second is a simple test for primeness.  The
#third evaluates sequences in the list of primes up to a million and and identifies
#the prime formed by the longest such sequence.  

#My code finds the correct answer -- 997651 -- in 6.6 seconds.  I added a few additional
#entries to the hash (start, end, and length of each sequence) so the output provides
#that information as well as the answer.  The additional operations run in 6.8
#seconds.  

def listOfPrimesUnderX (x)

#Generate list of numbers 2 through x

numberList = []
numberList = (2..x).to_a

# Create a loop that, first, removes the first number's multiples from numberList
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

return primeList

end

def is_prime(n)

#faster than using a function to create a list of primes under 10000000
#in this case because we don't have to test that many numbers.

if n == 0
	return false
end

for number in 2..Math.sqrt(n)
	if n % number == 0
		return false
	end
end

return true

end

def consecutivePrimeFinder

#First generate list of all primes less than 1000000
#create a lengths array to track how many primes are added, a solutions hash 
#(to store length and the prime formed by the consecutive primes), and several
#counters

lengths = []
solutionsHash = Hash.new
primes = listOfPrimesUnderX(1000000)
count = 1
	

#We start with the first 100 sequences (i.e., starting with the first prime,
#the second prime, up to the hundredth) although it's clear that the 
#solution is going to begin close to the first few primes, as the total
#primes that can be added and still stay under a million will tend to 
#decrease as the starting number goes up.

for n in (0..150)

#We start with a "sum" variable, which will be the total of the 
#continuous prime series, as well as an upper limit, or x, to
#calculate up to.  This number was chosen because adding the numbers
#2 up to the 550th prime yields a sum over 1000000, so the answer is 
#going to be less than that.  

sum = 0
x = 550

#The outer loop continues looping until a solution is found under 
#which the total sum of the consecutive primes is both prime and
#less than a million, after which we move to the next starting number.

	until lengths.length == count

#This loop calculates the sum of primes between the nth, which starts at 0, 
#and the xth, 550, element in the list of primes.

		for prime in primes[n..x]
			sum = prime + sum
		end

#This checks if the sum is less than a million and prime, if either is
#false, then we decrease the max by 1 and reset the sum.

			if sum > 1000000 || is_prime(sum) == false
				x -= 1
				sum = 0

#If both tests are passed, then we store the total length of the 
#consecutive prime to an array and the sum and the length to a 
#hash; this lets us find the max length and use the lookup function
#of the hash to figure out what prime has the max number of consecutive
#primes added to form it. I also saved the start, end, and length 
#of each solution to output the additional information.

			else
				lengths << x-n
				solutionsHash[x-n] = sum, primes[n], primes[x], x-n
			end

	end

#After a solution is found for a particular staring prime, we add one
#to the "count" variable, which is used to determine when to move
#to the next starting prime, and then return to the outermost for
#loop, which will move to the next starting prime.  Essentially, this 
#allows us to find one solution for each prime and then move to the
#next.

count += 1

end

#Now we use the two lists stored above: lengths, which stores the 
#length of all solutions for the first 100 prime numbers, and
#solutionsHash, which contains the prime numbers (i.e., sums) 
#resulting from each sequence of primes.  Specifically, we look 
#up which prime corresponds to the longest sequence of prime
#numbers.

puts "#{solutionsHash[lengths.max][0]} is the prime number less than a
million that is formed by the sum of the longest sequence of primes.
Specifically, it is formed by adding together #{solutionsHash[lengths.max][1]} to #{solutionsHash[lengths.max][2]}, a
sequence #{solutionsHash[lengths.max][3]} numbers long."

end

consecutivePrimeFinder