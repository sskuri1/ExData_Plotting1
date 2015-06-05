# reading the original data without "?"
power<- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

#formatting the date column
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

#subsetting the required data
#workingData <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),] ## this is one option
workingData <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# getting a Date and time column
workingData$Datetime <- as.POSIXct(paste(as.Date(workingData$Date), workingData$Time))

#plotting second graph

plot(workingData$Datetime, workingData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
