require 'date'


# Pass date object here to print the month
def printCurrentMonth(currentObject)
	case currentObject.month
	when 1
		puts "\t\t\t"+"January" 
	when 2
		puts "Febuary"
	when 3
		puts "March"
	when 4
		puts "April"
	when 5
		puts "May"
	when 6
		puts "June"
	when 7
		puts "\t\t\t"+"July"+" #{currentObject.year}"
	when 8
		puts "August"
	when 9
		puts "September"
	when 10
		puts "October"
	when 11
		puts "November"
	when 12
		puts "December"
	end
end
		
# weekday print after the above function call
def printHeader
	days_of_the_week = ["sun" ,"mon", "tue", "wed", "thur", "fri", "sat"]
	days_of_the_week.each { |x| print x+"\t"}
	puts ""
end
