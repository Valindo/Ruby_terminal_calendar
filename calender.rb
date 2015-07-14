require 'date'

def print_month(dateobject)
	month = Date::ABBR_MONTHNAMES
	puts "#{month[dateobject.month]}-#{dateobject.year}"
end

def print_weekdays(start_day_of_week)
	last_day_of_week = (start_day_of_week + 6)%7
	days_of_week = Date::ABBR_DAYNAMES
	while start_day_of_week%7 != last_day_of_week
		print "#{days_of_week[start_day_of_week%7]}\t"
		start_day_of_week+=1
	end
	print "#{days_of_week[start_day_of_week%7]}\n"
end




#test calls
date = Date.today
date = date << 1
print_month(date)
for i in (0..6)
	print_weekdays(i)
end