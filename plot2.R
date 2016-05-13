##  R code for Plot 2
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


## Create the plot2:
png("plot2.png", width = 480, height = 480)
plot(hpcSub$Global_active_power~hpcSub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()