=begin
	
Number letter counts
Problem 17
If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were 
written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 
(three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen)
contains 20 letters. The use of "and" when writing out numbers is in compliance 
with British usage.

=end


#My code is a hash coupled with a loop that breaks down numbers into their 
#constituent digits, translates those digits to words using the hash, 
#prints the result, and increments a "words" variable with the lengths of the words.  
#The end of the program outputs how many letters were used.

#Note: only works up to 20999 because I did not program in functionality for "twenty one thousand." 

#The following code finds the solution for 1 to 1000 (21124) in 0.0 seconds.

def numbersToWords(a,b)

numbers = {0 => "", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five"} 
numbers.merge! 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten"
numbers.merge! 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen" 
numbers.merge! 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen" 
numbers.merge! 19 => "nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty" 
numbers.merge! 50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety" 
numbers.merge! 100 => "hundred", 1000 => "thousand"
words = 0

for n in (a..b)

thousands = n/1000
hundredsAndTensAndOnes = n % 1000
hundreds = (hundredsAndTensAndOnes / 100) * 100
tensAndOnes = hundredsAndTensAndOnes - hundreds
tens = (tensAndOnes / 10) * 10
ones = tensAndOnes - tens

if thousands != 0 
print "#{numbers[thousands]} thousand "
words += numbers[thousands].length
words += numbers[1000].length
end

if thousands != 0 && hundreds == 0 && tensAndOnes != 0
print "and "
words += 3
end

if hundreds != 0
print "#{numbers[hundreds/100]} hundred "
words += numbers[hundreds/100].length
words += numbers[100].length
end

if hundreds != 0 && tensAndOnes != 0
print "and "
words += 3
end

if tensAndOnes > 19
print "#{numbers[tens]} #{numbers[ones]}"
words += numbers[tens].length
words += numbers[ones].length
end

if tensAndOnes < 20
print "#{numbers[tensAndOnes]}"
words += numbers[tensAndOnes].length
end

puts ""

end

print "There are #{words} letters in the written-out numbers between #{a} and #{b} (inclusive)."

end

numbersToWords(1,1000)