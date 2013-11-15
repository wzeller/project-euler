#Largest palindrome product
#Problem 4

#A palindromic number reads the same both ways. 
#The largest palindrome made from the product 
#of two 2-digit numbers is 9009 = 91 × 99.

#Find the largest palindrome made from the product of two 3-digit numbers.

def isPalindrome?(number)

#convert number to string and figure out if it is the same backwards

if number.to_s == number.to_s.reverse!
	return true
else
	return false
end

end

def largestPalindrome

solutions = []

#This loop checks all products of 3-digit numbers and, if palindromic,
#add to solutions array.  After this, it puts the highest such number.
#
#Returns the answer (906609) in 1.3 seconds.

for n in (100..999)
	for m in (100..999)
		x = n * m
		if isPalindrome?(x) == true
			solutions << (x)
		end
	end
end

puts solutions.max

end

largestPalindrome