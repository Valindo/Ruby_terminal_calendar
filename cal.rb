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


def holidays(date)

end



def populateCalender (currentObject, dow)
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

dow = 1
printCurrentMonth(date)
printHeader(1)
populateCalender(date,dow)


while 1
	choice = gets.chomp
	case choice
	when 'P','p'
		date = date << 1
		printCurrentMonth(date)
		printHeader(dow)
		populateCalender(date,dow)
	when 'N','n'
		date = date << -1
		printCurrentMonth(date)
		printHeader(dow)
		populateCalender(date,dow)
	when 'E','e'
		break

	when 'W','w'
		puts "0. Start on Sunday"
		puts "1. Start on Monday"
		dow = gets.chomp
		dow = dow.to_i
		printCurrentMonth(date)
		printHeader(dow)
		populateCalender(date,dow)		

	end
		
end


