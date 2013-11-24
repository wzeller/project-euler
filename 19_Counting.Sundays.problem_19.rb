=begin
	
Counting Sundays
Problem 19
You are given the following information, 
but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, 
but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month 
during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
	
=end

#The following code first sets the starting parameters (1/1/1900, a Monday)
#and begins the counters that will determine the passage of months and years:
#dayOfYear (x of 365 or x of 366); totalDays (a counter beginning on the first
#day, which is used to determine day of the week (any number evenly divisible by 7
#is a Sunday given the first day was Monday)); monthsInYear (counts up to 12); and
#the number of days in all months except February.  

#With these parameters in place, the code begins a loop that stops when year ==
#2001.  The loop performs several tests.  First, it determines whether the 
#year is a leap year or not and assigns "daysInYear" accordingly.  Next, it 
#creates an array of variables corresponding to the number of days in each month.
#Then, it checks whether dayOfYear is over total days (and, if so, resets parameters
#and increments year).  A similar check is performed for dayOfMomth.  Finally,
#if it's the first of the month and the day is Sunday and the year is NOT 1900
#(the problem asks for Sundays starting 1/1/01 but given info for 1/1/00), a counter is incremented.
#After each loop the day is incremented.

#The solution (171) is found in .1s. 

def countingSundays

year = 1900
dayOfMonth = 1
jan = 31
month = jan
dayOfYear = 1
totalDays = 1
monthsInYear = 0
jan = mar = may = july = aug = oct = dec = 31
apr = june = sept = nov = 30
totalSundays = 0

while year < 2001

	if year % 4 == 0 && year != 1900
		feb = 29
		daysInYear = 366
	else 
		feb = 28
		daysInYear = 365
	end

months = [jan, feb, mar, apr, may, june, july, aug, sept, oct, nov, dec]
monthNames = ["jan", "feb", "mar", "apr", "may", "june", "july", "aug", "sept", "oct", "nov", "dec"]
	
	if dayOfYear == daysInYear + 1
		year += 1
		dayOfMonth = 1
		dayOfYear = 1
		month = jan
		monthsInYear = 0
	end

	if dayOfMonth == month + 1
		month = months[monthsInYear + 1]
		monthsInYear += 1
		dayOfMonth = 1
	end

	if totalDays % 7 == 0 && dayOfMonth == 1 && year != 1900
		puts monthNames[monthsInYear]
		puts dayOfMonth
		puts year
		puts "is a Sunday"
		totalSundays += 1
	end
	

dayOfYear += 1
dayOfMonth += 1
totalDays += 1

end

puts totalSundays

end

countingSundays


