#This is the file of Plot 2: the ts plot of global active power
#--------------------------------------------------------------

# 1 Read the data:
dataa = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
#Convert the date variable into date object:
dataa["Date"] = as.Date(c(dataa["Date"])$Date, format = "%d/%m/%Y")
#2. we are implementing exporatory data analysis for two- days period in Feb, 2007 
toExp = dataa[dataa$Date == '2007-02-01' | dataa$Date == '2007-02-02', ]


#DO plot 2
tsDat = ts(as.numeric(toExp$Global_active_power))
dev.new(width = 480, height = 480, unit = "px")
ts.plot(tsDat, ylab = "Global Active Power (KW)")
dev.copy(png, file = "plot2.png") #save (as a copy from the screen) as plot.png
dev.off() #close the png device
