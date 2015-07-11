require 'date'

today = Date.today

year = today.year
month = today.month
puts month
month = today.month + 1
puts today.month


startDate = Date.new(year,month,1)
lastDate = Date.new(year,month,-1)

puts startDate.day
puts lastDate.day