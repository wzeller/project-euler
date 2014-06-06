#Summation of primes
#Problem 10
#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

#Find the sum of all the primes below two million.

#Finds answer (142913828922) in 15.6 seconds.

def sumOfPrimesUnderX (x)

# generate list of numbers 2 through x

  numberList = (2..x).to_a
  primeList = []

  # create a loop that, first, removes the first number's multiples from numberList
  # and that loops up to the square root of x


  while numberList[0] < Math.sqrt(x)

  	primeList << numberList[0]
  	y = numberList[0]

  #for example, for the first number, the following line deletes all multiples of 2 from the number list
  #and then does the same with 3, etc.  This is essentially the Sieve of Eratosthenes.

  	numberList.delete_if {|a| a % y == 0}

  end

  # Now we have two arrays: primeList, which contains all primes up to the square root of x, and numberList
  # which contains primes between the square root of x and x (any composites would be
  #eliminated while removing multiples of prime factors up to square root).  This 
  #array contains all primes up to x.

  puts (primeList + numberList).inject(:+)

end

sumOfPrimesUnderX (2000000)

# More cheaty (and performant) is this: 

# require 'mathn'

# puts Prime.inject{ |sum, ele| if  ele < 2_000_000  then  sum + ele  else  break sum  end }


