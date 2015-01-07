# Read in the data, assume the file is in the working directory
myData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Clean up the dates/times
library(lubridate)
myData$Date <- dmy(myData$Date)
myData$Time <- hms(myData$Time)

# Now just get the data for 2 Feb, 2007
Data <- subset(myData, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

# Create the third png, which is a subsetted line plot of each sub_metering in different colors
png(file = "plot3.png", width = 480, height = 480)
plot(Data$Date + Data$Time, Data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")
lines(Data$Date + Data$Time, Data$Sub_metering_1, col = "black")
lines(Data$Date + Data$Time, Data$Sub_metering_2, col = "red")
lines(Data$Date + Data$Time, Data$Sub_metering_3, col = "blue")
legend("topright", pch = "_", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()