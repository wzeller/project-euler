#Power digit sum
#Problem 16
#2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

#What is the sum of the digits of the number 2^1000?

#Strightforward code that calculates 2^1000, changes it to a string, splits it into 
#separate digits, converts each digit to an integer, puts each digit into an array,
#and then adds the contents of the array.  It finds the solution, 1366, in 0.0 seconds.

def powerDigitSum

arrayOfNumber = []
a = 2**1000
aString = a.to_s.split('')

for number in aString
	arrayOfNumber << number.to_i
end

puts arrayOfNumber.inject(:+)

end

powerDigitSum