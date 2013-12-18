=begin
Pandigital multiples
Problem 38
Take the number 192 and multiply it by each of 1, 2, and 3:

192 × 1 = 192
192 × 2 = 384
192 × 3 = 576

By concatenating each product we get the 1 to 9 pandigital, 
192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 
1, 2, 3, 4, and 5, giving the pandigital, 918273645, 
which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be 
formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?	

	
=end

#My solution consists of two methods.  The first translates any number into 
#a concatenated product of a specific length.  The second calculates the 
#set of all pandigitals, saves all concatenated products (between 1 and 9876)
#that are pandigital, and outputs the largest solution.

#My code finds the correct answer -- 932718654 -- in 2.4 seconds.


#The first method calculates a concatenated prduct for any number, "number," of 
#length "digits."

def concatenatedNumberFinder(number, digits)

#Change nmber to a string.
stringNumber = number.to_s

#Start count at 2, as this is the first multiplication.
count = 2

#This loop continues until the resulting string is length = or greater than "digits."
until stringNumber.length >= digits

#Here we see the string formation process.  It starts with the number, then adds strings
#with each sucessive multiplication until it is "digits" digits long.
stringNumber = stringNumber + ((number * count)).to_s
count += 1

end

#Returns the final number.
return stringNumber

end

#The second method cycles through the concatenated products of 1..9999 (it can be shown
#that there are no 5-digit numbers resulting in a 9-digit concatenated product quite
#easily, as 10000*2 is also 5 digits), and checks whether each is present in the 
#set of all pandigital numbers.  Again, the use of sets intead of arrays vastly 
#improves speed.  

def largestPandigitalMultipleFinder

require 'set'

#Form array of all 9-digit permutations of 1..9 (i.e., all pandigitals).
pandigitals = (1..9).to_a.permutation(9).map {|arr| arr.join}.to_set 

solutions = []

#Now we cycle through 1 up to the largest possible 4-digit starting number,
#check if the concatenated product is in the set of pandigitals,
#and save all resulting pandigitals to a "solutions" array.  The output is the
#largest solution.

for digit in 1..9876

	concatenatedNumber = concatenatedNumberFinder(digit,9)
	
	if pandigitals.include?(concatenatedNumber)
		solutions << concatenatedNumber 
	end

end

puts solutions.max

end

largestPandigitalMultipleFinder

