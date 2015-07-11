require 'date'


# Pass date object here to print the month
def printCurrentMonth(currentObject)
	yearNames = ["January","Febuary","March","April","May","June","July","August","September","October","November","December"]
	puts "\t\t\t"+"#{yearNames[currentObject.month-1]}" +" #{currentObject.year}"
end
		
# weekday print after the above function call
def printHeader
	days_of_the_week = ["mon", "tue", "wed", "thur", "fri", "sat","sun"]
	days_of_the_week.each { |x| print x+"\t"}
	puts ""
end

def populateCalender(currentObject)
	year = currentObject.year
	month = currentObject.month
	startDate = Date.new(year,month,1)
	startDay = startDate.day 
	weekDay = startDate.cwday #returns the week day number 1-7 1-monday
	lastDay = Date.new(year,month, -1).day

	for i in (startDay..35) do
		if i == weekDay
			print "#{startDay}"+"\t" if startDay <= lastDay
			weekDay+=1
			startDay+=1
		else
			print "\t"
		end
		puts "" if i%7==0
	end
	puts ""
end


date = Date.today

printCurrentMonth(date)
printHeader
populateCalender(date)


while 1
	choice = gets.chomp
	case choice
	when 'P','p'
		date = date << 1
		printCurrentMonth(date)
		printHeader
		populateCalender(date)
	when 'N','n'
		date = date << -1
		printCurrentMonth(date)
		printHeader
		populateCalender(date)
	when 'E','e'
		break
	end
		
end

