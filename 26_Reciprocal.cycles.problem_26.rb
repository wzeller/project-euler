=begin
	
Reciprocal cycles
Problem 26
A unit fraction contains 1 in the numerator. The decimal representation 
of the unit fractions with denominators 2 to 10 are given:

1/2	= 	0.5
1/3	= 	0.(3)
1/4	= 	0.25
1/5	= 	0.2
1/6	= 	0.1(6)
1/7	= 	0.(142857)
1/8	= 	0.125
1/9	= 	0.(1)
1/10	= 	0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. 
It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d  1000 for which 1/d contains the longest 
recurring cycle in its decimal fraction part.
	
=end

#My solution contains two methods.  The first finds the number of
#terms in the decimal for a fraction, 1/x, before it begins to 
#repeat.  The second runs the first method on the numbers 1/2 to
#1/1000, stores the length of the repeating decimals, and outputs
#the largest one.  

#This code find the answer, 1/983, in .9 seconds.

def longestRepeatingDecimalLengthfortheFractionOneOverX(x)

#The first method simply mimics long division and returns the
#number of cycles before which the decimal appx.
#of the fractions begins to repeat itself.

#The key to this algorithm is noticing that once long division 
#results in a remainder that is the same as one that has come 
#before, then the decimal will repeat itself.  Thus the function
#stores each remainder as it occurs, starts a count for each 
#remainder without a repetition, and then returns the count
#once either a repetion is encountered or x digits have gone by.
#X is the limit because there are a finite number of remainders for a 
#fraction 1/x, with x being the highest number of remainders
#possible.  I built a "fullExpansion" array into the method as well
#in case the decimal were required, although it isn't for this problem.

	digits = x.to_s.length
	
#The following loop is because 10 should be grouped with 1..9, as should 100, etc., 
#because they share the number of 0s after the decimal place as well as the first division
#in long division.  This is an exception to the rule that
#other numbers with the same number of digits have the 
#same number of zeros after the decimal.  The code accomplishes this by creating a digits variable
#equal to the number of digits in x (1/x) with an exception for multiples
#of ten.

	if x % 10 == 0
		digits -= 1
	end

#firstDigit is a variable equal to the first step in a long division 1/x.
#E.g., if x is 3, the first digit is equal to 10 (10^1) divided by 3.
#Because ruby's math is automatically only the integer portion of a division, 
#10/3 = 3.

	firstDigit = (10 ** digits) / x

#fullExpansion creates the start for all decimal appx. of 1/x by 
#starting with "0." and adds the number of 0s equal to number of "digit"
#minus one.  In other words, for 1/3, because there is only 1 digit, 
#no 0s are added following the decimal and the first number is 
#firstDigit, or 3.  We can see why 10 is an exception, because 
#the decimal approx. for it, like 2..9, is .1, with no 0s between
#decimal and firstDigit.  (The above line corrects for this.)

	fullExpansion = "0" + "." + "0" * (digits-1) + firstDigit.to_s

#Next I create array to add each additional digit to.

	fullExpansionArray = [fullExpansion.to_f]

#The first number in long division is 10^digits, which is used
#as the first number from which x * firstDigit will be subtracted
#to get the first remainder.  Also, it is always going to be greater
#than or equal to the possible remainders, which means there is no 
#problem adding it to the lookup table of remainders.

	remainder = (10 ** digits).to_i 

#This is the lookup table to store each remainder.

	remainders = []

#k is the counter variable to count the number of digits without a 
#repetition.  In other words, every time the long division repeats
#without the same remainder, the number of digits in the
#decimal expression of the fraction 1/x, k, goes up by one.

	k = 0

#The number of cycles for the long division is capped at x+1 (x = 2 needs
#3 reps to terminate).

	for digits in 1..x+1
	
#First we see if there is a repition in remainder.  If so, the
#method terminates and returns k, or the number of terms before
#it started to repeat.  (Note, this can be tweaked to return 
#the full decimal as well.)

		if remainders.include? remainder
			fullExpansionArray = fullExpansionArray.join
			return k
		end

#Adds the remainder to an array of remainders.

		remainders << remainder

#Calculates next remainder.

		remainder = (remainder - (x*firstDigit))*10

#Calculates the next digit (called "firstDigit") in the 
#decimal.

		firstDigit = remainder / x

#Saves the next digit to the array with all digits.

		fullExpansionArray << firstDigit 

#Increments the variable to keep track of the number of digits without
#a repeated remainder.

		k += 1

	end

end

def determineLongestRepeatingDecimalinOneOver2toOneOverOneThousand

#First create array to store the lengths of repeating decimals.

	decimalArray = []

#Next loop through the numbers 1/2 through 1/1000 and store their 
#repeating decimal lengths into an array.

for n in 2..1000
	decimalArray << longestRepeatingDecimalLengthfortheFractionOneOverX(n)
end

#Last output the index number (+2 because we start at 2 and the first index
#is 0) for the highest number of repetitions in the array.  The index is 
#x in the form 1/x.  

puts "1/#{decimalArray.index(decimalArray.max)+2}"
puts "is the fraction with the longest repeating decimal sequence"

end

determineLongestRepeatingDecimalinOneOver2toOneOverOneThousand



