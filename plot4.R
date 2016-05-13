##  COde for plot4
##  This code combines plot2 and plot3 with two additional charts into one layout
##  of two rows and two columns

getwd()
setwd("~/Coursera/ExploratoryDataAnalysis")

## Read the data into a data table
hpcData <- read.table("~/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", header=TRUE, 
                      sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")

## Convert Date from Character to Date type
hpcData$Date <- as.Date(hpcData$Date, format="%d/%m/%Y")

## Create a subset using data from the two dates 2007-02-01 and 2007-02-02
hpcSub <- subset(hpcData, (hpcData$Date == "2007-02-01" | hpcData$Date== "2007-02-02"))

## Add time and convert to Date
hpcDateTime <- paste(as.Date(hpcSub$Date), hpcSub$Time)
hpcSub$Datetime <- as.POSIXct(hpcDateTime)

## initiate the png file and set the parameters for the chart
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(hpcSub, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
  plot(Global_reactive_power~Datetime, type="l", xlab="datetime")
})
dev.off()
