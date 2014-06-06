#10001st prime
#Problem 7
#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
#we can see that the 6th prime is 13.
#
#What is the 10 001st prime number?

#Gets answer (104743) in .8 seconds.

def isPrime(number)

	return true if number == 2

	(2..Math.sqrt(number)).each do |n|
		if number % n == 0
			return false
		end
	end

	true

end

def whatIsTheXthPrime?(x)

	num_primes = 1
	number = 3

	until num_primes == x
		if isPrime(number) 
			num_primes += 1
			number += 1
		else
			number += 1
		end
	end

	number-1

end

p whatIsTheXthPrime?(10001)
