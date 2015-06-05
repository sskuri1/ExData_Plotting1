# reading the original data without "?"
power<- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

#formatting the date column
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

#subsetting the required data
#workingData <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),] ## this is one option
workingData <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# getting a Date and time column
workingData$Datetime <- as.POSIXct(paste(as.Date(workingData$Date), workingData$Time))

#plotting third graph

plot(workingData$Datetime, workingData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(workingData$Datetime, workingData$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "red")
points(workingData$Datetime, workingData$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "blue")
legend("topright", lty = 1, lwd=2,cex = 0.75, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
