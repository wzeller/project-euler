#Sum square difference
#Problem 6
#The sum of the squares of the first ten natural numbers is,

#1^2 + 2^2 + ... + 10^2 = 385
#The square of the sum of the first ten natural numbers is,

#(1 + 2 + ... + 10)^2 = 55^2 = 3025
#Hence the difference between the sum of the squares of the first ten 
#natural numbers and the square of the sum is 3025 − 385 = 2640.

#Find the difference between the sum of the squares of the first one 
#hundred natural numbers and the square of the sum.

def sumSquareDifference

#Store sum of squares of 1 through 100 in one variable and sum of 1 through 
#100 in another.  Square the sum of the numbers and subtract the sum of 
#squares.

#Produces the correct answer, 25164150, in 0.0 seconds.

for n in (1..100)
	squares += (n ** 2)
	sum += n
end

puts sum ** 2 - squares

end

sumSquareDifference
