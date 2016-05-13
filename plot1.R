getwd()
setwd("~/Coursera/ExploratoryDataAnalysis")

## Read the data into a data table
hpcData <- read.table("~/Coursera/ExploratoryDataAnalysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")

## Convert Date from Character to Date type
hpcData$Date <- as.Date(hpcData$Date, format="%d/%m/%Y")

## Create a subset using data from the two dates 2007-02-01 and 2007-02-02
hpcSub <- subset(hpcData, (hpcData$Date == "2007-02-01" | hpcData$Date== "2007-02-02"))

## Convert the plot data to numeric
hpcGlobalActivePower <- as.numeric(hpcSub$Global_active_power)

## Create the plot1:
png("plot1.png", width = 480, height = 480)
hist(hpcGlobalActivePower, main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()