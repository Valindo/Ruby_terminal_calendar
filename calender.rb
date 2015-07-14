require 'date'


#Format : Month-Year
# 1-Jan....12-Dec
def print_month_n_year(date_object)
	month = Date::ABBR_MONTHNAMES
	puts "\t\t\t#{month[date_object.month]}-#{date_object.year}"
end

#Format : Sun 	Mon 	Tue ....
# 0-Sun....6-Sat
def print_weekdays(start_day_of_week)
	last_day_of_week = (start_day_of_week + 6)%7
	days_of_week = Date::ABBR_DAYNAMES
	while start_day_of_week%7 != last_day_of_week
		print "#{days_of_week[start_day_of_week%7]}"
		print "\t"
		start_day_of_week+=1
	end
	print "#{days_of_week[start_day_of_week%7]}"
	puts ""
end

def print_previous_dates(date_object, start_day_of_week)
	previous_month = date_object - 1
	if date_object.wday != start_day_of_week
		while previous_month.wday != start_day_of_week
			previous_month = previous_month - 1
		end

		while previous_month.wday != date_object.wday
			print "*#{previous_month.day}"
			print "\t"
			previous_month = previous_month + 1
		end
	end
end

def print_next_dates(date_object,start_day_of_week)
	end_day_of_week = (start_day_of_week + 6)%7
	if date_object.wday == end_day_of_week
		return
	end
	date_object = date_object + 1
	if date_object.wday != end_day_of_week
		while date_object.wday != end_day_of_week
			print "*#{date_object.day}"
			print "\t"
			date_object = date_object + 1
		end
		print "*#{date_object.day}"
		print "\t"
	end
end

#prints the calender which includes the headers ( month, year, days of the week)
def print_calender(date_object, start_day_of_week)
	
	#print the first few parts of the calender
	print_month_n_year(date_object)
	print_weekdays(start_day_of_week)

	date_object = Date.new(date_object.year,date_object.month,1)
	last_day = Date.new(date_object.year,date_object.month,-1)
	end_day_of_week = (start_day_of_week + 6)%7

	print_previous_dates(date_object,start_day_of_week)

	while date_object.day != last_day.day
		print "#{date_object.day}"
		print "\t" 
		puts "" if end_day_of_week == date_object.wday
		date_object = date_object + 1
	end
	print "#{date_object.day}"
	print "\t"
	print_next_dates(date_object,start_day_of_week)

	puts ""
end


#test calls
dow = 1
date = Date.today
print_calender(date, dow)


while 1
	puts "p - previouse\nn - next\nw - change dow\ne - exit"
	choice = gets.chomp
	case choice
	when 'P','p'
		date = date << 1
		print_calendar(date, dow)
	when 'N','n'
		date = date << -1
		print_calender(date, dow)
	when 'W','w'
		puts "0-sun.....6-sat"
		dow = gets.chomp.to_i
		print_calender(date, dow)
	when 'E','e'
		break
	end
end

