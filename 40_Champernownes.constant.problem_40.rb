=begin

Champernowne's constant
Problem 40
An irrational decimal fraction is created by concatenating the positive integers:

0.123456789101112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, 
find the value of the following expression.

d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

=end

#Very straightforward question and solution as each digit, n, is the n-1th
#digit of an array 1..10,000,000.  The code below first creates the array, then
#converts each number to a string and splits them into digits, then outputs
#the product of the digits in the question.  Because the number is quite large,
#the code takes 9.8 seconds to find the correct answer -- 210.

def champernownesConstantFinder

fraction =* (1..1000000).to_a
fraction = fraction.to_s.split('').map(&:to_i)

puts fraction[0] * fraction[9] * fraction[99] * fraction[999] * fraction[9999] * fraction[99999] * fraction[999999]

end

champernownesConstantFinder
