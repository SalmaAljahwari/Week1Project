#This is the file of Plot 1: the histogram of the Global Active power
#--------------------------------------------------------------------
install.packages('lubridate')
install.packages('data.table')
library(lubridate)
library('data.table')
# 1 Read the data:
dataa = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
#Convert the date variable into date object:
dataa["Date"] = as.Date(c(dataa["Date"])$Date, format = "%d/%m/%Y")
#2. we are implementing exporatory data analysis for two- days period in Feb, 2007 
#so select the days, month=feb and year = 2007 
toExp = dataa[weekdays(dataa$Date) == "Thursday" | weekdays(dataa$Date) == 'Friday', ]
toExp = toExp[months(toExp$Date) == "February" & year(toExp$Date) == "2007", ]

#DO plot 1
dev.new(width = 480, height = 480, unit = "px")
hist(as.numeric(toExp$Global_active_power), xlab = "Global Active Power", main = "", col = "red") #make the plot
title(main = "Global Active Power") #set the title
dev.copy(png, file = "plot1.png") #save (as a copy from the screen) as plot.png
dev.off() #close the png device




