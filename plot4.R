#this is the script where plot4 is made: the 2x2 matrix:
#-------------------------------------------------------

# 1 Read the data:
dataa = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
#Convert the date variable into date object:
dataa["Date"] = as.Date(c(dataa["Date"])$Date, format = "%d/%m/%Y")
#2. we are implementing exporatory data analysis for two- days period in Feb, 2007 
toExp = dataa[dataa$Date == '2007-02-01' | dataa$Date == '2007-02-02', ]

#do the plot:
dev.new(width = 480, height = 480, unit = "px")
par(mfrow = c(2, 2))
#---plot (1, 1)
ts.plot(as.numeric(toExp$Global_active_power), ylab = "Global Active Power (KW)")
#--plot(1, 2)
ts.plot(as.numeric(toExp$Voltage), ylab = "Voltage")
#--plot(2, 1)
plot(as.numeric(toExp$Sub_metering_1), ylab="Energy Sub metering", type="l")
lines(as.numeric(toExp$Sub_metering_2), col = "red")
lines(as.numeric(toExp$Sub_metering_3), col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
#--plot(2, 2)
ts.plot(as.numeric(toExp$Global_reactive_power), ylab = "Global Rective Power (KW)")
#--save copy as png
dev.copy(png, file = "plot1.png") #save (as a copy from the screen) as plot.png
dev.off() #close the png device
