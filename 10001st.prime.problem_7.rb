#10001st prime
#Problem 7
#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
#we can see that the 6th prime is 13.
#
#What is the 10 001st prime number?

def isPrime(number)

#test if a number is divisible by any numbers up to its 
#square root (if it divisible by a number greater than
#its square root, it will also be divisible by a number
#less than its square root, so we can stop the search there)

if number == 2
	return false
end

for n in (2..Math.sqrt(number))
	if number % n == 0
		return false
	end
end

return true

end

def whatIsTheXthPrime?(x)

primes = [2]
number = 3

until primes.length == x

	if isPrime(number) == true
		primes << number
		number += 1
	else
		number += 1
	end

end

puts primes[-1]

end

whatIsTheXthPrime?(10001)