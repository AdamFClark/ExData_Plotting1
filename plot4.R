# Read in the data, assume the file is in the working directory
myData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Clean up the dates/times
library(lubridate)
myData$Date <- dmy(myData$Date)
myData$Time <- hms(myData$Time)

# Now just get the data for 2 Feb, 2007
Data <- subset(myData, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

# Create the fourth png, which is has 4 partitions, using two previous charts and two new ones

png(file = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

#TopLeft
  plot(Data$Date + Data$Time, Data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type="n")
  lines(Data$Date + Data$Time, Data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "")

#TopRight
  plot(Data$Date + Data$Time, Data$Voltage, ylab = "Voltage", xlab = "datetime", type="n")
  lines(Data$Date + Data$Time, Data$Voltage, ylab = "Voltage", xlab = "datetime")

#BottomLeft
  plot(Data$Date + Data$Time, Data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")
  lines(Data$Date + Data$Time, Data$Sub_metering_1, col = "black")
  lines(Data$Date + Data$Time, Data$Sub_metering_2, col = "red")
  lines(Data$Date + Data$Time, Data$Sub_metering_3, col = "blue")
  legend("topright", pch = "_", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#BottomRight
  plot(Data$Date + Data$Time, Data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type="n")
  lines(Data$Date + Data$Time, Data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime")

dev.off()


