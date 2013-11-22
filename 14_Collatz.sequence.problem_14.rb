def collatzUpToNumber(number)

collatzLength = Hash.new
collatzLength[1] = 1
collatzLength[2] = 2
terms = 0
test = 0

for element in (2..number)

test = element
terms = 0

	until test == 1

		if collatzLength[test] != nil
			terms += collatzLength[test]
			test = 1

		elsif test.odd? 
			test = (3*test)+1
			terms += 1

		elsif test.even?
			test = test/2
			terms += 1

		end
	
	end
	collatzLength[element]=terms
end

puts collatzLength.max_by{|k,v| v}

end

collatzUpToNumber(1000000)


