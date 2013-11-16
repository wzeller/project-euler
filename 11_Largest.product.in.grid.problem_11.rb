#Largest product in a grid
#Problem 11

#In the 20×20 grid below, four numbers along a diagonal line have 
#been marked in red.

=begin
	
08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48

The product of these numbers is 26 × 63 × 78 × 14 = 1788696.

What is the greatest product of four adjacent numbers in the same 
direction (up, down, left, right, or diagonally) in the 20×20 grid?

=end

#My script finds the answer (70600674) in .1 seconds. Because the up/down
#and left/right products are the same, I calculate the across products, the
#down products, then both diagnol direction products, put all products into
#an array, and print the highest one.

def largestProductinDataSet

dataArray = []

#First I store the number into string without hard returns.

n = "08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08 49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00 81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65 52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91 22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80 24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50 32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70 67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21 24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72 21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95 78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92 16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57 86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58 19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40 04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66 88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69 04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36 20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16 20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54 01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48"

#Then I split the string into separate elements in array by spaces and convert
#each to an integer.

dataArray = n.split(/ /).collect{|s| s.to_i}

#create array to store products and begin by calculating the "across" products.

products = []
a = 0
b = 3

#The last across quad will be 89 19 67 48, which would have b, the index
#of 48, as 399.  Thus we stop finding across products when b is equal 
#to or greater than 400.  

while b < 400

	products << dataArray[a..b].inject(:*) 

#At the end of each line, we need to advance by 4, because the sequences
#cannot straddle two lines.

	if b % 19 == 0
		a += 4
		b += 4

	else
		a += 1
		b += 1

	end

end

#Next we calculate products for down numbers starting with the upper left and
#ending in the lower right (when a will == 319).

a = 0
b = 20
c = 40
d = 60

while a < 320

	products << dataArray[a]*dataArray[b]*dataArray[c]*dataArray[d]

	a += 1
	b += 1
	c += 1
	d += 1

end

#Next, populate array with products of right/left diagonals.

a = 0
b = 21
c = 42
d = 63

while d < 400

	products << dataArray[a]*dataArray[b]*dataArray[c]*dataArray[d]

#when we get to the 4th to the last number in each row (index of 16 or a multiple
#thereof), we need to advance to the next line by adding 4 to each of the 
#index trackers.  Otherwise, we can increment by 1.

	if a % 16 == 0
		a += 4
		b += 4
		c += 4
		d += 4
	else
		a += 1
		b += 1
		c += 1
		d += 1
	end

end

#Last, populate with the products for left/right diagonals.

a = 3
b = 22
c = 41
d = 60

while d < 397

	products << dataArray[a]*dataArray[b]*dataArray[c]*dataArray[d]

#Like the across quadruplets, these need to go the next line when the first number
#reaches the end of the line (i.e., has an index that is a multiple of 19).

	if a % 19 == 0
		a += 4
		b += 4
		c += 4
		d += 4
	else
		a += 1
		b += 1
		c += 1
		d += 1
	end

end

#Print the highest product in the array.

puts products.max

end

largestProductinDataSet