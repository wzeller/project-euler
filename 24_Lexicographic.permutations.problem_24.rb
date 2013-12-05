=begin

Lexicographic permutations
Problem 24
A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation 
of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, 
we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

=end

#This problem is very simple using Ruby's permutation method.  First I populate an array
#with digits 0..9, then print the 1,000,000th element of an array with all permutations
#of those digits.  The answer, 2783915460, is found in 2.6 seconds.

def findPermutation

digits =* (0..9)

print digits.permutation(10).to_a[999999]

end


def findPermutationTheLongWay(numberOfDigits)

digits =* (0..numberOfDigits-1)

k = numberOfDigits-2

puts digits

while digits[k] < digits[k+1]
	l = 0
	for digit in digits
		if digit == digits[k]+1
			digits[k], digits[l] = digits[l], digits[k]
			k, l = l, k
			next
		end
		l += 1
	end
	puts digits
end

end

findPermutationTheLongWay(3)








