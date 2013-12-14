=begin

Digit canceling fractions
Problem 33

The fraction 49/98 is a curious fraction, 
as an inexperienced mathematician in attempting to simplify it may 
incorrectly believe that 49/98 = 4/8, which is correct, 
is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, 
less than one in value, and containing two digits in the numerator and 
denominator.

If the product of these four fractions is given in its lowest common 
terms, find the value of the denominator.	

=end

#The following code cycles through all numbers 10/11..99/99, splits
#the numerator and denominator into separate digits, saves each digit as
#new variables, calculates the value of the fraction, checks to see whether  
#any digits across from each other are equal and, if so, whether the 
#digits are equal to the fraction.  If both tests are passed, then 
#the resulting fraction is printed and a total numerator and total
#denomiator variable are multiplied by the resulting numerator 
#and denominator of the fraction.  The last line outputs the
#decimal expression of the product of the four fractions.  Because
#it is .01, the answer (i.e., denominator of the lowest common
#denominator of the fraction) is clearly 100.

#The following code finds the correct answer, 1/100, in .0 seconds.

def findDigitCancelingFractions

#Define two variables to store the numerators and denominators.
totalNum = 1
totalDenom = 1

#Nested for loops cycle through every fraction with two digits in 
#the numerator and denominator that are less than 1.
for num in 10..99
	for denom in num+1..99

#The following 6 lines split the numerator and denominator into 
#separate digits and store each to separate variables.
		numDigits = num.to_s.split('')
		denomDigits = denom.to_s.split('')

		a = numDigits[0].to_f
		b = numDigits[1].to_f 
		c = denomDigits[0].to_f
		d = denomDigits[1].to_f

#Value of fraction stored as fraction (must be a float to avoid 
#the problem that int round up).
		fraction = num.to_f/denom.to_f 

#This line has two tests: (1) whether one digit in the numerator
#is the same as the opposite digit in the denominator; and (2) 
#whether the value of the non-matching digits are equal to 
#the fraction as a whole.
		if (a == d || b == c) && (fraction == a/d || fraction == b/c)
				puts num
				totalNum *= num.to_f
				puts "--"
				puts denom
				totalDenom *= denom.to_f
				puts ""
		end

	end
	
end

puts "The product of all non-trivial digit-cancelling fractions is #{totalNum/totalDenom}."

end

findDigitCancelingFractions