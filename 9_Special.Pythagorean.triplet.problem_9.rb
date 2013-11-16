#Special Pythagorean triplet
#Problem 9
#A Pythagorean triplet is a set of three natural numbers, a < b < c, 
#for which,

#a^2 + b^2 = c^2
#For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.

#Finds product (31,875,000) in .1 seconds.


def pythagoreanTriplet

for a in (1..333)
	for b in (a..500)
		if a ** 2 + b ** 2 == ((1000-(a+b))**2) && (1000-(a+b))>b
			puts a
			puts b
			puts (1000-(a+b))
			puts ""
			puts a*b*(1000-(a+b))
		end
	end
end

end

pythagoreanTriplet