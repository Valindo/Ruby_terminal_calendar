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
		print "#{days_of_week[start_day_of_week%7]}\t"
		start_day_of_week+=1
	end
	print "#{days_of_week[start_day_of_week%7]}\n"
end

def print_previous_dates(date_object, start_day_of_week)
	month_start_day = date_object.wday - start_day_of_week
	if month_start_day != start_day_of_week
		date_object = date_object - month_start_day
		for i in (0...month_start_day) do
			print "#{date_object.day}*\t"
			date_object = date_object +1
		end
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
		print "#{date_object.day}\t"
		if end_day_of_week == date_object.wday
			puts ""
		end
		date_object = date_object + 1
	end
	
	puts ""

end


#test calls
date = Date.today
for i in (0..6)
	print_calender(date, i)
end