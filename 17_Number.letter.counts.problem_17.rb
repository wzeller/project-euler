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

#The following code is basically a dictionary and a loop that converts the hundreds, 
#tens and ones digits to words and adds "and" as necessary.  It's not the most elegant
#code, but it finds the solution, 21124, in 0.1 seconds.

def numbersToWords

numbers = {1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety", 100 => "hundred", 1000 => "onethousand"}
numberToWords = []

for n in 1..1000
	if n >= 100 && n < 1000
		hundreds = (n.to_i/100) * 100
		hundreds = hundreds / 100
		numberToWords << numbers.fetch(hundreds) + numbers.fetch(100)
			if n - (hundreds * 100) != 0
				numberToWords << "and"
			end
		tens = n - (hundreds * 100)
			if tens != 0
				tens = (tens.to_i/10) * 10
				if tens < 20
					numberToWords << numbers.fetch(n-(hundreds * 100))
				else
					numberToWords << numbers.fetch(tens)
					ones = n - (hundreds * 100) - tens
					if ones != 0
						numberToWords << numbers.fetch(ones)
					end
				end
			end
	end
	if n < 100
		tens = ((n.to_i/10) * 10)
		if tens < 20
					numberToWords << numbers.fetch(n)
				else
					numberToWords << numbers.fetch(tens)
					ones = n - tens
					if ones != 0
						numberToWords << numbers.fetch(ones)
					end
				end
		end
	if n == 1000
		numberToWords << numbers.fetch(n)
	end
end

puts numberToWords.join.length

end

numbersToWords