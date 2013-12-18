=begin
	
Integer right triangles
Problem 39

If p is the perimeter of a right angle triangle with integral 
length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
	
=end


def rightTriangleFinder

total = []

#We run through all possible leg lengths of the right triangles up to 1000 (as anything
#higher cannot have a hyptoneuse under 500 and a perimeter
#under 1000).  This is done using nested for loops that
#always keep a as the larger variable (to avoid duplicates and make it faster).

for a in 1..500

	for b in 1...a

#Next we calculate the hypotenuese, c.

		c = Math.sqrt((a*a) + (b*b))

#And test if c is an integer.

		if c - c.to_i == 0

#If it is an iteger, we test if it's within the perimeter is less than or equal to 1000.

			if a + b + c <= 1000 

#If it is, we save it to an array, total.

			total << (a + b + c)

			end
		end
	end

end

#Next we use "group_by" to create a hash with the keys corresponding to the various  
#perimeters and the value being a multi-dimensional array with 
#the value and every instance of that perimeter.

total = total.group_by{|i| i}

#Finally, we use the "max_by" function to find the key (x) with the longest
#array of perimeters associated with it (x[1]).  This gives us the perimeter with the
#most solutions. 

puts total.max_by{|x| x[1].length}[0]

end

rightTriangleFinder