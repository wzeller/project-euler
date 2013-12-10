=begin
	
Number spiral diagonals
Problem 28
Starting with the number 1 and moving to the right in a 
clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 
1001 by 1001 spiral formed in the same way?
	
=end

#My solution is based on the pattern of a cube of numbers 
#sized nxn.  First, the first number in the top right to
#lower left diagonal will be n squared (in the example
#above, 25).  From there, the 
#next four numbers in alternating diagonals will be n-1
#less than the previous number.  Every four numbers that 
#pass, the distance between the next numbers (increment) goes down 
#by two.  This spiral sequence continues until the first 
#number, here "start," equals 1.

#To see how this works, one can look at the example above (a 5x5 grid), where 
#we start with 25, subtract 4 and add the total four times
#(21, 17, 13, 9), then subtract 2 and add the total three times
#(7,5,3) until the total ("start") equals 1, at which point the loop stops
#and the program outputs the solution with 1 added (preventing 1 from 
#being double-counted).

#My code finds the solution, 669171001, in 0.0 seconds.

def diagonalCount(n)

#First number saved as "start.""
start = n**2

#Solution is the variable to which we add all elements of the diagonals.
solution = 0

#Increment is the gap between elements of diagonals.  
increment = n - 1

#The first loop continues until start == 1.
while start > 1

#The number of diagonal elements for each "increment."
k = 4

#The second, nested loop, which repeats four times for each increment
#and adds the diagonal entries (stored in the "start" variable)
#to solution.
while k > 0
solution += start
start -= increment
k -= 1
end

#After each sequence of 4 entries, we subtract two from the increment
#variable to add the diagonal elements in the next "square" within the
#grid.
increment -= 2

end

#After the final loop is complete, start will equal 1, but will not
#have been added to solution.  The final step is to add 1 and output
#the solution.

puts solution + 1

end

diagonalCount(1001)


