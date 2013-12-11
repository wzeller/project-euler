=begin
Coin sums
Problem 31
In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
How many different ways can £2 be made using any number of coins?
=end

#This was one of the most difficult problems, particularly to answer
#without a lot of code and reasonably quickly.  The key insight
#is that any given value can either be made with, or without, a 
#certain coin.  To calculate how many ways a value can be made,
#one can start with a list one longer than the value for which we
#want to make change (0 can be made one way), then cycle through 
#each coin (starting at the amount of the coin), adding the 
#number of ways the value could be made NOT using that coin.
#The process is repeated with each coin, which will result in a 
#list where the nth element is equal to the number of ways the
#value n could be made using the coins provided.

#Because this is very complicated, an example is useful.  If we 
#were interested in making 10 pence, the following steps would
#be taken.  

#First, nake a list 11 elements long, which represents how 
#many ways each value (0-10) can be made using only 1 pence
#coins: {1,1,1,1,1,1,1,1,1,1,1}

#Next, we go through each value 2 or greater and add in the 
#number of ways each could be made IF we used the 2p coin.  
#For example, there is 1 way to make 2 using only 1s, and 1
#way to make it using the 2p.  The latter value is equal to 
#the number of ways to make 0, or 2-2, which is equal to 1.
#This process is repeated for 3, which equals 1 way to make with 
#only ones, and 1 way to make with 1 2 and 1 1, 4, which equals
#one way to make with 1s and 2 ways to make with 2 (2,1,1 or 2,2), 
#totaling three.  As the list is updated, the number of ways to 
#make a value using a coin are equal to the value WITHOUT the coin
#plus the value of the element in the list [value-coin], which is the
#number of ways to make the remainder WITH the coin, or, in other words,
#the number of ways to make the number with the coin.  After the 2p coin
#step, the list is {1,1,2,2,3,3,4,4,5,5,6}.  Again, each element in the
#list is equal to the number of ways to make the value of the index with
#and without using the 2p coin.  (E.g., 10 can be made using 0-5 
#2p coins).

#The next step repeats the process with 5p, resulting in the list   
#{1,1,2,2,3,4,5,6,7,8,10}.  Finally we use 10p, which adds 1 
#possibility to the 10th element in the list, resulting in 11
#ways to make 10p.  (Obviously coins higher than the total cannot
#be used).

#As the program is running, at any given point the list will equal
#all ways to make a particular number using all coins up to the 
#coin being cycled through.  So if, for example, the program is at
#list[17] and is going through the 5p loop, all prior elements in the
#list will equal ways to make the value WITH 3 5p, and all other elements
#will be ways to make 5p WITHOUT using the 5p coin.  Thus list[18] (ways
#to make 18 without 5p) will be added to list[13] (which will be the vays to make 
#18 using only 2 5p coins) to get the total ways to make 18 with 3 5p
#coins.  

#My code comes up with the solution, 73682, in .1 seconds.

def coinCount(target)

coins = [2,5,10,20,50,100,200]
list = []

#First populate a list target+1 items long (to include 0) with 1s, which
#represent the way to make each value using only 1s.

(target+1).times do

	list << 1

end

#Next we cycle through all coins, smallest to largest, and update
#each element in the list with the ways to make a certain value
#without the coin (the value already at the index) added to the
#ways to make the value with the coin (equal to the value at the
#index coin elements ago).  By the time all coins have been cycled
#through, we will have the number of ways to make each value using
#all available coins.  

for coin in coins

	for number in coin..target

		list[number] += list[number-coin]

	end

end

puts list[target]

end

coinCount(200)