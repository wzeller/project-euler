=begin
	
Factorial digit sum
Problem 20
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!

=end

#Below are two methods.  The first is a brief recursive function to calculate
#factorial.  The second takes a number, n, calculates the factorial, converts
#the number to separate digits and maps each digit, as an integer, to an array.
#Then it prints the sum of all digits.

#The following code results in the solution -- 648 -- in 0.0 seconds.

def factorial(number)
	return 1 if number == 1 
	return number * factorial(number-1)
end

def sumOfDigitsofNFactorial(n)

array = []
a = factorial(n).to_s.split('').map {|s| s.to_i}
puts a.inject(:+)

end

sumOfDigitsofNFactorial(100)
