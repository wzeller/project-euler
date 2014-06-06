#Multiples of 3 and 5
#Problem 1
#If we list all the natural numbers below 10 that are multiples of 3 or 5, 
#we get 3, 5, 6 and 9. The sum of these multiples is 23.

#Find the sum of all the multiples of 3 or 5 below 1000.

#My script runs in 0.0s and produces the answer of 233168.


def findMultiplesOf3and5

  total = 0

  (1..999).each do |n| 
  	total += n if n % 3 == 0 || n % 5 == 0
  end

  total

end

puts findMultiplesOf3and5
