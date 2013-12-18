=begin

Double-base palindromes
Problem 36
The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)

=end

#Simple solution involving two methods: the first tests whether the number is 
#a palindrome in both bases; the second cycles through the numbers 1-1,000,000
#and adds all the palindromic numbers together and outputs the total.

#My code finds the solution -- 872,187 -- in 1.8 seconds.  


def palindromeTest(number)

numberBaseTwo = number.to_s(2)
numberBaseTen = number.to_s

if numberBaseTwo == numberBaseTwo.reverse && numberBaseTen == numberBaseTen.reverse
	return number
end

end

def palindromeFinder

solutions = 0

for n in (1..1000000)

	if palindromeTest(n) != nil
		solutions += palindromeTest(n)
	end

end

puts solutions

end

palindromeFinder
