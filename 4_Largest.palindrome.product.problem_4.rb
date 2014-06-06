#Largest palindrome product
#Problem 4

#A palindromic number reads the same both ways. 
#The largest palindrome made from the product 
#of two 2-digit numbers is 9009 = 91 × 99.

#Find the largest palindrome made from the product of two 3-digit numbers.

#This loop checks all products of 3-digit numbers and, if palindromic,
#changes the solution. 

#Returns the answer (906609) in .2 seconds.

def isPalindrome?(number)
  return true if number.to_s == number.to_s.reverse!
  false
end

def largestPalindrome
  solution = 0

  (100..999).each do |n|
  	(100..999).each do |m|
  		if (n*m) > solution && isPalindrome?(n*m) 
  			solution = n*m 
  		end
  	end
  end

  solution 

end

p largestPalindrome
