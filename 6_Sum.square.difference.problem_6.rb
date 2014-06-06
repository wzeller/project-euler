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

#Produces the correct answer, 25164150, in 0.0 seconds.

def sumSquareDifference

  squares = 0
  sum = 0

  (1..100).each do |n|
  	squares += (n ** 2)
  	sum += n
  end

  sum ** 2 - squares

end

p sumSquareDifference
