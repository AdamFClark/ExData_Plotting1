# Read in the data, assume the file is in the working directory
myData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Clean up the dates/times
library(lubridate)
myData$Date <- dmy(myData$Date)
myData$Time <- hms(myData$Time)

# Now just get the data for 2 Feb, 2007
Data <- subset(myData, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

# Create the second png, which is a line plot of the Global_active_power over time
png(file = "plot2.png", width = 480, height = 480)
plot(Data$Date + Data$Time, Data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type="n")
lines(Data$Date + Data$Time, Data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

