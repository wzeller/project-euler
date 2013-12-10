=begin
	
Distinct powers
Problem 29
Consider all integer combinations of ab for 2 ≤ a ≤ 5 and 2 ≤ b ≤ 5:

22=4, 23=8, 24=16, 25=32
32=9, 33=27, 34=81, 35=243
42=16, 43=64, 44=256, 45=1024
52=25, 53=125, 54=625, 55=3125
If they are then placed in numerical order, 
with any repeats removed, we get the following sequence of 15 distinct terms:

4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125

How many distinct terms are in the sequence generated by ab for 2 ≤ a ≤ 100 
and 2 ≤ b ≤ 100?
	
=end

#I solve this problem with a single method including two arguments, a, which
#is the first number and first exponent, and b, which is the last number and
#last exponent.  The method comprises two nested loops.  The first cycles 
#through the numbers a..b, and the second cycles through the exponents, a..b,
#for each number in the first loop.  All of the solutions, a^b, are saved to
#an array called "solutions."  The end of the program outputs the length of 
#the unique entries in solutions, which is the number of distinct terms 
#asked for in the problem.

#My code finds the answer, 9183, in 0.0 seconds.

def distinctPowers(a,b)

solution = []

number = a
exponent = a

while number <= b

	while exponent <= b
		solution << number ** exponent
		exponent += 1
	end

number += 1
exponent = a

end

puts solution.uniq.length

end

distinctPowers(2,100)


