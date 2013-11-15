#Multiples of 3 and 5
#Problem 1
#If we list all the natural numbers below 10 that are multiples of 3 or 5, 
#we get 3, 5, 6 and 9. The sum of these multiples is 23.

#Find the sum of all the multiples of 3 or 5 below 1000.

def findMultiplesOf3and5

#My solution populates an array with all multiples of 3 or 5
#between 1 and 999 and then prints the sum of all those numbers.
#Script runs in 0.0s and produces the answer of 233168.

solutions = []

for n in 1..999

	if n % 3 == 0 || n % 5 == 0
		solutions << n
	end

end

puts solutions.inject(:+)

end

findMultiplesOf3and5