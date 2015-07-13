require 'date'


# Pass date object here to print the month
def printCurrentMonth(currentObject)
	yearNames = ["January","Febuary","March","April","May","June","July","August","September","October","November","December"]
	puts "\t\t\t"+"#{yearNames[currentObject.month-1]}" +" #{currentObject.year}"
end
		
# weekday print after the above function call
def printHeader(dow)
	if dow==1
		days_of_the_week = ["mon", "tue", "wed", "thur", "fri", "sat","sun"]
	else
		days_of_the_week = ["sun","mon", "tue", "wed", "thur", "fri", "sat"]
	end
	days_of_the_week.each { |x| print x+"\t"}
	puts ""
end



# def populateCalender(currentObject,dow)
# 	dow = dow - 1
# 	year = currentObject.year
# 	month = currentObject.month
# 	startDate = Date.new(year,month,1)
# 	startDay = startDate.day 
# 	weekDay = startDate.cwday #returns the week day number 1-7 1-monday
# 	lastDay = Date.new(year,month, -1).day
# 	rowCount = 1
# 	previousDays = weekDay - 1
# 	previousDays = -previousDays
# 	#FUCKING LOGIC TO PRINT PREVIOUS DAYS
# 	if weekDay > 0
# 		previousMonth = currentObject << 1
# 		previousMonth = Date.new(previousMonth.year,previousMonth.month,previousDays)
# 		for i in (1..weekDay-1+dow) do
# 			print "*#{previousMonth.day}\t"
# 			previousMonth = previousMonth + 1
# 		end
# 	end
# 	for i in (startDay+dow...lastDay+1) do
# 		# if i == weekDay
# 		# 	print "#{startDay}"+"\t" if startDay <= lastDay
# 		# 	weekDay+=1
# 		# 	startDay+=1
# 		# else
# 		# 	print "\t"
# 		# end
# 		print "#{startDay}"+"\t" if startDay <= lastDay
# 		startDay+=1
# 		if weekDay%7 == 0
# 			puts ""
# 			rowCount+=1
# 		end
# 		weekDay+=1
# 	end
	
# 	if rowCount > 5
# 		endOfCal = 42
# 	else
# 		endOfCal = 35
# 	end

# 	#PRINT NEXT MONTH'S DATES
# 	nextMonth = currentObject << -1
# 	nextMonth = Date.new(nextMonth.year,nextMonth.month,1)
# 	for i in (weekDay..endOfCal + dow) do
# 		print "*#{nextMonth.day}\t"
# 		nextMonth = nextMonth+1
# 	end
# 	puts ""
# end

def populateCalender (currentObject, dow)
	dow -=1
	currentObject = Date.new(currentObject.year,currentObject.month,1)
	lastDay = Date.new(currentObject.year,currentObject.month,-1).day

	if dow == 1
		weekDay = currentObject.cwday
		count = 1
	else
		weekDay = currentObject.wday
		count = 0
	end

	for i in (count...weekDay) do
		currentObject = currentObject - 1
	end

	for i in (count...weekDay) do
		print "*#{currentObject.day}\t"
		currentObject+=1
	end

	for i in (1..lastDay) do
		print "#{currentObject.day}\t"
		puts "" if dow == 0 and currentObject.saturday? 
		puts "" if dow == 1 and currentObject.sunday?
		currentObject+=1
	end

	currentObject -=1
	if dow == 0
		while !currentObject.saturday?
			currentObject+=1
			print "*#{currentObject.day}\t"			
		end
	elsif dow == 1
		while !currentObject.sunday?
			currentObject+=1
			print "*#{currentObject.day}\t"
		end
	end
	puts ""
end



date = Date.today

printCurrentMonth(date)
printHeader(2)
populateCalender(date,1)


while 1
	choice = gets.chomp
	case choice
	when 'P','p'
		date = date << 1
		printCurrentMonth(date)
		printHeader(1)
		populateCalender(date,dow)
	when 'N','n'
		date = date << -1
		printCurrentMonth(date)
		printHeader(1)
		populateCalender(date,2)
	when 'E','e'
		break

	when 'W','w'
		puts "1. Start on monday"
		puts "2. Start on Sunday"
		dow = gets.chomp
		dow = dow.to_i
		printHeader(dow)
		populateCalender(date,dow)		

	end
		
end


