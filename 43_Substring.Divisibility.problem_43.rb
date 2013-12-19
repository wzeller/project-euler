=begin

Sub-string divisibility
Problem 43
The number, 1406357289, is a 0 to 9 pandigital number because it is 
made up of each of the digits 0 to 9 in some order, but it also has a rather 
interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17

Find the sum of all 0 to 9 pandigital numbers with this property.

=end

#I first wrote a very short program using the permutations function in Ruby, but it 
#took over a minute.  The following two methods build up each 10-digit number piece by
#piece.  Although somewhat long, the program runs extremely quickly.

#The first method is a simple check to see if a number is pandigital for 0..9.  The second
#goes through each 3-digit sub-string and checks for divisibility and, if it is 
#divisible, creates a new number and adds it to an array.  After generating all 
#possible solutions (i.e., all solutions withe the prime divisibility called for
#in the problem), I then identify those which are pandigital, print them, and print 
#their sum.

#The following code finds the answer -- 16695334890 -- in .4 seconds.  (The shorter 
#code took about 70 seconds).

def isPandigital?(number)

#Convert the number to string, split it into digits, sort them, and rejoin the number.

string = number.to_s.split('').sort.join

#All pandigitals will equal a string of the digits.

if string == "0123456789"
	return true
end

return false

end

def formPandigitalStrings

#First initialize all the arrays we will use.

number17 = []
number13 = []
number11 = []
number7 = []
number5 = []
number3 = []
number2 = []
final = []

#Start with the final three numbers, which must be divisible by 17.

for n in 001..999

	if n % 17 == 0

		number17 << n

	end

end

#Iterate through all 17-divisible numbers, adding a new digit in front,
#and checking whether the first 3 digits would be divisible by 13.  If
#so, add to a new array (with 4 digits).  This process is repeated for
#each triplet below, so I will not comment them.

for entry in number17

	entryString = entry.to_s.split('')

	for n in 0..9

		if (n.to_s + entryString[0..1].to_s).to_i % 13 == 0

			if (n.to_s + entryString[0..2].to_s).length == 4

			number13 << (n.to_s + entryString[0..2].to_s)

			end

		end

	end
end

for entry in number13

	entryString = entry.to_s.split('')

		for n in 0..9

		if (n.to_s + entryString[0..1].to_s).to_i % 11 == 0

			if (n.to_s + entryString[0..3].to_s).length == 5

			number11 << (n.to_s + entryString[0..3].to_s)

			end

		end

	end

end

for entry in number11

	entryString = entry.to_s.split('')

		for n in 0..9

		if (n.to_s + entryString[0..1].to_s).to_i % 7 == 0

			if (n.to_s + entryString[0..4].to_s).length == 6

			number7 << (n.to_s + entryString[0..4].to_s)

			end

		end

	end

end

for entry in number7

	entryString = entry.to_s.split('')

		for n in 0..9

		if (n.to_s + entryString[0..1].to_s).to_i % 5 == 0

			if (n.to_s + entryString[0..5].to_s).length == 7

			number5 << (n.to_s + entryString[0..5].to_s)

			end

		end

	end

end

for entry in number5

	entryString = entry.to_s.split('')

		for n in 0..9

		if (n.to_s + entryString[0..1].to_s).to_i % 3 == 0

			if (n.to_s + entryString[0..6].to_s).length == 8

			number3 << (n.to_s + entryString[0..6].to_s)

			end

		end

	end

end

for entry in number3

	entryString = entry.to_s.split('')

		for n in 0..9

		if (n.to_s + entryString[0..1].to_s).to_i % 2 == 0

			if (n.to_s + entryString[0..7].to_s).length == 9

			number2 << (n.to_s + entryString[0..7].to_s)

			end

		end

	end

end

#Because the first digit is not subject to any divisibility 
#constraints, I added all 10 of them to each entry in the 
#array of 9-digit numbers above and saved the new, 10-digit
#numbers to an array called "final."
for entry in number2

	entryString = entry.to_s.split('')

		for n in 0..9

			final << (n.to_s + entryString.to_s)

		end

end

#Now we declare a solution variable and test each element
#for pandigitality (they were already tested for 
#divisibility above).  If it is, we print it and add it
#to solution.  At the end, we print solution.

solution = 0

for element in final

	if isPandigital?(element)
		puts element
		solution = solution + element.to_i
	end

end

puts solution

end

formPandigitalStrings
