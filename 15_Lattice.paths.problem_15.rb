=begin
Lattice paths
Problem 15
Starting in the top left corner of a 2×2 grid, 
and only being able to move to the right and down, 
there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
=end

#My first solution was based on noticing that the number of paths mirrors the center
#term in every other level of pascal's triangle.  The middle term in the 40th row
#is 137846528820, which is the answer.  But the solution below was very helpful in 
#learning some coding concepts. 

#The following simple code can solve the lattice paths problem for a grid with 
#(axb) dimensions very quickly.  

#It involves two techniques based on two insights.

#The first insight is that the number of paths to any point in the grid (a,b) is the sum
#of the number of paths to the point above that point (a,b-1) and the number of paths to the 
#left of the point (a-1, b).  For example, there is one way to get to (0,1), one 
#way to get to (1,0).  Thus there are two ways (via 0,1 and via 1,0) to get to (1,1).

#The second insight is that any time you reach an "edge" (i.e., (0,n) or (n,0)) there is only
#one way to that point; you could get there by solely right turns or only down turns, as there is 
#no backtracking.

#Both of these insights make this problem ideally suited to a recursive solution.  In 
#other words, to find out how many paths to a certain point, the code looks backwards
#to see how many paths to the point immediately above and to the left.  To find out those
#points, the code looks to the points above and to the left of THOSE points.  Etc.  One
#stop condition is when the recursive loop hits an edge, where it returns one.  

#A bare recursive solution, however, would take an extremely long time, particularly as a and 
#b get higher.  Adding memoization -- i.e., a lookup table -- drastically cuts that time.
#Essentially, each time the number of paths is calculated to a certain point, (a,b), that
#number of paths is saved in the hash "@cache" with a key [a][b] and a value = paths. This 
#allows another stop condition to be added to the recursive loop, which returns the number
#of paths any time a loop tries to calculate paths to a point that has already been analyzed.

#This code finds 137846528820, the solution for 20x20, in 0.0 seconds, and  
#10295250013541443297297588032040198675721092538107764823484905957592333237265
#195859833659551897649295156404859, the number of paths through a 200x200 grid, in 1.9
#seconds.  

@cache = Hash.new

def paths(a,b)
  return @cache[[a,b]] if @cache[[a,b]]
  return 1 if a==0 or b==0
  @cache[[a,b]] = paths(a-1,b) + paths(a,b-1)
end

puts paths(20,20)
