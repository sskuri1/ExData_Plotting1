# reading the original data without "?"
power<- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

#formatting the date column
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

#subsetting the required data
#workingData <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),] ## this is one option
workingData <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# getting a Date and time column
workingData$Datetime <- as.POSIXct(paste(as.Date(workingData$Date), workingData$Time))

#plotting fourth graph

par(mfrow = c(2, 2))

# plot 1x1 
plot(workingData$Datetime, workingData$Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "")

# plot 1x2 
plot(workingData$Datetime, workingData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot 2x1
plot(workingData$Datetime, workingData$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
     xlab = "", col = "black")
points(workingData$Datetime, workingData$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
       col = "red")
points(workingData$Datetime, workingData$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"), bty = "n" )

# plot 2x2)
plot(workingData$Datetime, workingData$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
