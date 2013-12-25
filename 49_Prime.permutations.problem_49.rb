=begin
	
Prime permutations
Problem 49
The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, 
is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, 
but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
	
=end

#There are two functions involved in this solution.  The first is a simple prime number check.  The second generates a list of 4-digit
#primes, makes permutations of each, divides them into three, checks whether they form an arithmetic sequence and whether the 
#permutations are prime, and stops after 2 solutions are found (the one in the problem definition and the second one).  

#My code finds the answer --296962999629 -- in 2.6 seconds.

def is_prime(n)

#Faster than using a function to create a list of primes under 10000000
#in this case because we don't have to test that many numbers.

for number in 2..Math.sqrt(n)
	if n % number == 0
		return false
	end
end

return true

end


def fourDigitNumberPrimes

fourDigitPrimes = []
solutions = []

##First we generate a list of four digit primes.
	for x in (1000..9999)

		if is_prime(x) == true
			fourDigitPrimes << x
		end

	end

	for prime in fourDigitPrimes

#Then, for each prime, we generate a list of permutations using each digit,
#group the permutations into four digit numbers, split the list of numbers to separate entries in an 
#array and convert them to integers.  This gives a list of all permutations 
#of each four digit prime to further analyze for: (1) primeness; (2) arithmetic
#sequence (i.e., whether they are separated by a constant); and (3) four-digit (permutations starting with 0 or 00 will be 3 or two digits)


		permuts = []
		differences = []

#Splits each prime to separate digits and then permutes all possibilities.

		permuts << prime.to_s.split('').map(&:to_i).permutation(4).to_a

#Puts a space between every four digits, splits the string by each space and maps to an array, and converts each number to integer.

		permuts = permuts.to_s.gsub(/.{4}/, '\0 ').split(" ").map {|s| s.to_i}

#Gets rid of duplicates and sorts by size.

		permuts = permuts.sort.uniq

#Then we look at all groups of three of the permutations for each prime, which
#we test for: (1) whether they are in an arithmetic sequence; (2)
#whether they are prime; and (3) whether they are 4-digits.  Given any trio
#of numbers that meet these criteria will be a solution, and there are only
#two, we print the resulting "solutions" array to find the unknown trio.

#Form groups of three numbers from each of the series of permutations.

		combosOfPermuts = permuts.combination(3).sort.uniq.to_a

#Each element in the new array, combosOfPermuts, has 3 subelements, all of which are 4-digit permutations.  The following loop
#continues until all three criteria are met twice, at which point a solution has been reached.

		for combo in combosOfPermuts
			if (combo[0] - combo[1]).abs == (combo[1] - combo[2]).abs && is_prime(combo[0]) == true && is_prime(combo[1]) == true && is_prime(combo[2]) == true && combo[0].to_s.length == 4 && combo[1].to_s.length==4 && combo[2].to_s.length==4
				solutions << combo
			end
			
			if solutions.uniq.length == 2
				break
			end

		end
	end	

puts solutions.uniq[0].join
puts solutions.uniq[1].join

end

fourDigitNumberPrimes