# Read in the data, assume the file is in the working directory
myData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Clean up the dates/times
library(lubridate)
myData$Date <- dmy(myData$Date)
myData$Time <- hms(myData$Time)

# Now just get the data for 2 Feb, 2007
Data <- subset(myData, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

# Create the first png, which is a histogram of Global_active_power
png(file = "plot1.png", width = 480, height = 480)
hist(Data$Global_active_power, col = "red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()

