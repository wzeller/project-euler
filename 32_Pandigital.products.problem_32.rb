=begin
Pandigital products
Problem 32

We shall say that an n-digit number is pandigital if it makes use of all the digits 
1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, 
multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product 
identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only 
include it once in your sum.	

=end

#This problem is about determining the proper contraints.  

#First we can see that if the product was only 3 digits, that would mean each of the multiplicands 
#would be 3 diigts, and there is no way to form this, as even the lowest such product, 
#100 * 100, would be 10,000.  So the product must be more than 3 digits.  

#It can obviously be 4 digits (per the example), so the next question is whether it could be 5 digits.  If
#so, that would mean two numbers, both two digits long, could multiply to a 5-digit
#number.  This is impossible (99*99 = 9801).  This means the product will be 4 digits long.

#The next question is how long the multiplicands will be.  They could be 1 and 4 digits, or 2 and 3
#digits.  1234*5 = 6170, a 4-digit number, so they could be 1 and 4 digits.  Again, per the example, the
#could be 2 and 3 digits (39*186).  So the answers will be in the form AB * CDE = FGHI or A * BCDE = 
#FGHI, where each letter is a different number.

#The following code includes two tests and a method to generate all possible 9-digit pandigital
#numbers and determine which fulfill the first two tests.  These numbers are then put into 
#an array from which duplicates are removed and then all the numbers are added together and 
#outputted for the answer. 

#The following code returns the answer, 45,228, in 4.6 seconds.      


#Test 1 -- returns true when the first two digits of n multiplied by digits 3-5 of that number
#equal digits 6-9 of the number.  

def testTwoThree(n)

	n[0..1].to_s.to_i * n[2..4].to_s.to_i == n[5..9].to_s.to_i
	
end

#Test 2 -- returns true when the first digit of n multiplied by digits 2-5 equals digits 6-9.

def testOneFour(n)

	n[0].to_s.to_i * n[1..4].to_s.to_i == n[5..9].to_s.to_i

end

def countPandigitalProducts

products = []

#This next two lines: (1) generate all permutations of 1..9 (i.e., all pandigital numbers 9 digits long) 
#and put them in an array; then (2) add a number comprised fo digits 6-9 of any such permutation 
#to array "products" if either the first or the second test (above) returns true; 
#then (3) output the sum of the unique array of such numbers, which is the answer.

(1..9).to_a.permutation(9) {|p| products << p[5..9].to_s.to_i if (testOneFour(p) || testTwoThree(p)) }
puts products.uniq.inject(:+)

end

countPandigitalProducts