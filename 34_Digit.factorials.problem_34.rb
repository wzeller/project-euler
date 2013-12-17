=begin

Digit factorials
Problem 34

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial 
of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.	

=end

#My code has two parts: a factorial method and a method that tests
#numbers between 10 and 9,999,999 for whether the digits are 
#equal to the number.

def factorial(number)

if number == 0

	return 1

end

if number == 1 

	return 1

end 

return (factorial(number-1) * number)

end

def factorialDigitTester

solution = []

facts = Hash.new

for n in 0..9

	facts[n] = factorial(n)

end

#We can see that an 8-digit number cannot be formed by the sum of the factorials of its
#digits by noting the largest 7-digit number, 9,999,999, is only equal to 2,540,160.  
#Thus 2,540,160 is the upper-bound for numbers to check out. 

#The following finds the answer (40,730) in 25.4 seconds. 

for number in 3..2_540_160

	total = 0

#Convert each number to an array of separate digits.

	digits = number.to_s.chars.map(&:to_i)

	for digit in digits

#Calculate sum of factorials of digits.

		total += facts[digit]

	end

#Check if total of sum of factorials equals number.

	if total == number

		solution << number

	end

end

#Output sum of solutions.

puts solution.inject(:+)

end

factorialDigitTester

