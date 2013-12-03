=begin

Non-abundant sums
Problem 23
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. 
For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, 
the smallest number that can be written as the sum of two abundant numbers is 24. 
By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. 
However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number 
that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

=end

#This problem has three steps: (1) write code that checks for abundance; (2) generate all abundant numbers between 1 and 28123 and 
#generate all of the sums of such numbers less than 28123; (3) check whether any number, 1 to 28123, is in the list of abundant sums and
#if not, add it to a "solution" variable; output that variable when done. 

#Following code finds the solution (4179871) in 16.2 seconds.

#First I write a method that tests whether a number is abundant.  By starting from the square root of the number, the 
#test is much faster.  Also, the method stops immediately when the total of the divisors is larger than the number.

def abundantTest(num)

  divisor = Math.sqrt(num).to_i
  sum = 0
  num = num

  while divisor > 1 && sum <= num
    if num % divisor == 0
      sum += divisor
  #This "unless" test is to avoid adding the square root of a number to the sum of the divisors twice.
      unless divisor == num/divisor
        sum += (num/divisor)
      end
    end
    divisor -= 1
  end
  if sum > num
    return true
  end
end

def nonAbundantNumbers

#Use sets instead of arrays because it's faster.

require 'set'

s1 = Set.new
s2 = Set.new

for num in (1..28123)
  if abundantTest(num)
    s1.add(num)
  end
end

#Convert back to array because order matters in the next step.

s1Array = s1.to_a.sort

#Index variable allows the second for loop to begin at the same spot as the first for loop (i.e., not checking numbers lower than n
#because those would be found by earlier loops).

index = 0

for n in s1Array
  index += 1

#Start at index - 1 to keep those totals where the abundant is added to itself (i.e., 24).

  for o in s1Array[index-1..6971]
#Go to next n if the sum is greater than 28123, as it's only going to be higher afterwards.
    next if n + o > 28123
    s2.add(n+o)
  end
end

solution = 0

#Iterate through numbers up to 28123 and add each one that is not in the set of abundant sums (s2).

for number in (1..28123)
  if s2.include?(number) != true
    solution += number
  end
end

puts solution

end

nonAbundantNumbers


