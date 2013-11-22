=begin

Longest Collatz sequence
Problem 14
The following iterative sequence is defined for the set of positive integers:

n  n/2 (n is even)
n  3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13  40  20  10  5  16  8  4  2  1
It can be seen that this sequence (starting at 13 and finishing at 1) 
contains 10 terms. Although it has not been proved yet (Collatz Problem), 
it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

=end

#My code starts with a hash containing two entries for the first two values.  
#Then it cycles through all the numbers from 2 up to the number below which
#we want to find the longest chain.  Then it enters another loop that terminates
#when the value ends at either 1 or any number saved in the hash.  If the value
#is neither 1 nor any number already in the hash, then the program tests whether
#it is odd or even and does the appropriate manipulation as well as adding one
#to the "terms" variable.  After the code is complete (either reaching 1 or a number
#that reached one), the starting number and the number of terms is stored in the hash
#so that it can be used in later calculations (this improves the speed by a factor
#of eight).

#Finds the solution (837799) in 10.8 seconds.

def longestCollatzChainUnderNumber(number)

#Initialize hash, set terms variable.
collatzLength = Hash.new
collatzLength[1] = 1
collatzLength[2] = 2
terms = 0
test = 0

#Outer loop that starts with 2 and ends at the number inputted by the user.
for element in (2..number)

#Use test variable to keep track of the changing terms in the chain.
test = element
terms = 0

#Inner loop that continues until the last chain is either 1 or already calculated
#and stored in the dictionary.

	until test == 1

#If there is an entry in the dict, then the program adds it to "terms" and 
#sets the test variable to 1 so the loop terminates.

		if collatzLength[test] != nil
			terms += collatzLength[test]
			test = 1

		elsif test.odd? 
			test = (3*test)+1
			terms += 1

		elsif test.even?
			test = test/2
			terms += 1

		end
	
	end

#Upon exiting the until loop, the program saves the starting number with 
#the number of terms in the hash.

	collatzLength[element]=terms

end

#Selects the key and value associated with the max value and prints them.

puts collatzLength.max_by{|k,v| v}

end

longestCollatzChainUnderNumber(1000000)


