def countPrimes (nthPrime)
	
	primes = 1
	number = 3
	primesList = [2]
	nonprimesList = []
	prime = 1

	while primes < nthPrime
	
	    prime = 1

		for n in primesList
			if number % n == 0
		    	prime = 0
		    end
		end

		if prime == 1
	    	primesList << number 
	    	primes += 1
		end
	
	number += 1

	end

puts primesList.last

end

countPrimes(10001)

