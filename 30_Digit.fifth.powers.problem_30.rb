=begin
Digit fifth powers
Problem 30
Surprisingly there are only three numbers that can be written 
as the sum of fourth powers of their digits:

1634 = 14 + 64 + 34 + 44
8208 = 84 + 24 + 04 + 84
9474 = 94 + 44 + 74 + 44
As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written 
as the sum of fifth powers of their digits.
=end


def sumOfDigits

solutions = []
a = []

	#The main difficulty with this problem is where to put the limit.  
	#The way to think about this is whether a certain number cannot possibly
	#be expressed by the sum of the fifth power of its digits.   Simple analysis
	#shows that a 7-digit number CANNOT be written this way.  This can be seen because 
	#even the largest 7-digit number (9999999) is not a 7-digit number once one 
	#takes the sum of the cubes of the digits (413343).  On the other hand, a 6-digit
	#number can potentially be written as the sum of the cube of its digits.  
	#Because we don't know exactly which 6-digit number is the highest that 
	#can be expressed as the sum of the cube of its digits, we simply use 
	#the highest possible sum of the cubes of a 6-digit number, 9^5*6, 
	#as the highest possible solution.  (There is no way to form a higher
	#number 6 digits long as the sum of the cubes of its digits.)

	#My code finds the solution, 443839, in 4.8 seconds.

	for n in 2..354294

	#This compact line does all the real work in the method: it converts 
	#n to a string, splits the string into separate digits, forms an 
	#array with each element being the cube of each digit, and defines
	#"a" as the sum of the resulting cubes.
		a = n.to_s.split('').map {|digit| digit.to_i ** 5}.inject(:+)

	#The following outputs and saves to a separate array - solutions -
	#all numbers are equal to the sum of the cubes of its digits.

		if a == n
			puts a
			solutions << a
		end

	end

puts solutions.inject(:+)

end

sumOfDigits